/* File MedicationProvider C# implementation of class MedicationProvider */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;


// global declaration end

public class MedicationProvider : ECA
{
// class declaration start
    protected const string AMIODARONE = "AmiodaroneFirstDose";
    protected const string EPINEPHRINE = "Epinephrine";
    protected const string IVACCESS = "IVAccess";

    private TimeRecorder timeRecorder;

    protected enum MedicationProviderState {
        None,
	    Idle,
	    InstallingIVAccess,
	    TakingMedicine,
	    InjectingMedicine,
        MedicineTaken
    };
// class declaration end


    private MedicationTable medicationTable;
    private DestinationMedicationProvider destination;
    private Patient patient;
    private IVPole pole;
    private Locker locker;
    private SystemManager systemManager;
    private UseMedicine useMedicine;
    private Rubbish rubbishTable;

    public MedicalRoom medicalRoom;

    protected override void Awake()
    {
        base.Awake();
        medicalRoom = FindObjectOfType<MedicalRoom>();
        destination = FindObjectOfType<DestinationMedicationProvider>();
        patient = FindObjectOfType<Patient>();
        timeRecorder = FindObjectOfType<TimeRecorder>();
        systemManager = FindObjectOfType<SystemManager>();
    }

    protected override void Start()
    {
        base.Start();
        medicationTable = medicalRoom.GetMedicationTable();
        rubbishTable = medicalRoom.GetRubbishTable();
        pole = medicalRoom.GetPole();
        locker = medicalRoom.GetLocker();

        //just for debug
        //HandleUseMedicine(MedicineName.Epinephrine);
        //HandleIVAccess();
    }


    private void HandleUseMedicine(MedicineName medicineName)
    {        

        // check if iv access ahas been inserted

        if (!patient.HasIVAccess)
        {
            SendDirectMessage("Ti sei dimenticato di dirmi di inserire l'accesso venoso, faccio da solo va...");

            Utility.LogWarning("Asked to inject " + medicineName + " but iv access is missing");
    
            IVAccess ivAccess = new IVAccess(this, medicationTable.GetVeinTube(), patient);
            ivAccess.CompletedAction += OnIvAccessCompleted;

            actionsList.Enqueue(ivAccess);
        }

        if(State == MedicationProviderState.TakingMedicine || State == MedicationProviderState.MedicineTaken)
        {
            actionsList.AbortAll();

            if (State == MedicationProviderState.MedicineTaken)
            {
                MedicineSpot medicineSpot = medicationTable.GetEmptySpot();
                DropMedicine dropMedicine = new DropMedicine(this, useMedicine, medicineSpot);
                actionsList.Enqueue(dropMedicine);
            }
        }

        useMedicine = CreateGetMedicineAction(medicineName);
        useMedicine.InjectionDone += OnInjectionDone;
        actionsList.Enqueue(useMedicine);
    }


    private void HandleIVAccess()
    {
        // check if iv access is already on
    
        if(patient.HasIVAccess)
        {
    	    SendDirectMessage("Guarda che l'accesso alle vie venose � gi� stato inserito, che cavolo chiedi?");
    	    Utility.LogWarning("Requested IVAccess when it was already in place");
    	    return;
        }

        // else, execute action
        SendDirectMessage("Ok, vado a fare l'accesso.");
        IVAccess ivAccess = new IVAccess(this, medicationTable.GetVeinTube(), patient);
        ivAccess.CompletedAction += OnIvAccessCompleted;
        actionsList.Enqueue(ivAccess);
    }


    private void OnInjectionDone(object sender, EventArgs e)
    {
        UseMedicine useMedicine = (UseMedicine)sender; 
        useMedicine.InjectionDone -= OnInjectionDone;
        MedicineEventArgs args = (MedicineEventArgs)e;
        MedicineName name = args.medicineName;
        //send message of completed action

        if (name == MedicineName.Epinephrine)
        {
            timeRecorder.TimeExpired += OnTimeExpired;
            timeRecorder.CheckTime(this, 2f);
            systemManager.CheckAction(useMedicine.ActionName);
            SendDirectMessage("Ho finito l'iniezione di epinefrina.");
            patient.OnEpinephrineDone();
        }
        else
        {
            systemManager.CheckAction(useMedicine.ActionName);
            SendDirectMessage("Ho finito l'iniezione di amiodarone.");
            patient.OnAmiodaroneDone();
        }
    }

    private void OnTimeExpired(object sender, EventArgs e)
    {
        TImeRecorderEventArgs ecaArg = (TImeRecorderEventArgs)e;

        if(ecaArg.eca == this)
        {
            timeRecorder.SendDirectMessage("Sono passati 2 minuti, devi fare un'altra iniezione di epinefrina!");
            //mettere in coda se sta facendo qualcosa
            HandleUseMedicine(MedicineName.Epinephrine);
        }
    }

    private void OnIvAccessCompleted(object sender, EventArgs e)
    {
        // changing patient state
        IVAccess iVAccess = (IVAccess)sender;
        iVAccess.CompletedAction -= OnIvAccessCompleted;
        systemManager.CheckAction(iVAccess.ActionName);
        SendDirectMessage("Accesso venoso completato.");
        patient.OnIvAccessDone();
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }


    protected UseMedicine CreateGetMedicineAction(MedicineName medicineName)
    {
        UseMedicine useMedicine = null;
        MedicineSpot m = medicationTable.GetMedicineSpot(medicineName);
        if (m != null)
        {
            //send message
             useMedicine = new UseMedicine(this, m, patient, rubbishTable);
        }
        else
        {
            Drawer d = locker.GetMedicineDrawer(medicineName);
            Assert.IsNotNull(d);    //just for debug, in real cases could be null
            
            if(d != null)
                useMedicine = new UseMedicine(this, d, patient, rubbishTable);
        }
    
        return useMedicine;
    }


    protected MedicationProviderState State
    {
      get {
    	if(currentAction == null)
    		return MedicationProviderState.Idle;

            if (currentAction is IVAccess)
                return MedicationProviderState.InstallingIVAccess;

            if(currentAction is UseMedicine)
            {
                UseMedicine useMedicine = (UseMedicine)currentAction;
                if (!useMedicine.hasMedicine)
                    return MedicationProviderState.TakingMedicine;
                else
                    return MedicationProviderState.MedicineTaken;

            }

            return MedicationProviderState.None;
      }
    }


    public override void Handle(Intent intent)
    {
        base.Handle(intent);
        switch (intent.IntentName)
        {
            case AMIODARONE:
                HandleUseMedicine(MedicineName.Amiodarone);
                break;
            case EPINEPHRINE :
                HandleUseMedicine(MedicineName.Epinephrine);
                break;
            case IVACCESS :
                HandleIVAccess();
                break;
        }
    }


    public Vector3 GetDestinationNearTable()
    {
        return destination.transform.position;
    }


    public override void SubscribeHandlerToIntentManager()
    {
        List<string> intentName = new List<string> { AMIODARONE , EPINEPHRINE , IVACCESS };
    
        foreach(var intent in intentName)
    	IntentManager.Instance.AddIntentHandler(intent, this);
    
    }


}
