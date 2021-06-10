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
protected const string AMIODARONE = "Amiodarone";
protected const string EPINEPHRINE = "Epinephrine";
protected const string IVACCESS = "IVAccess";

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

    public MedicalRoom medicalRoom;


    private void HandleUseMedicine(MedicineName medicineName)
    {
        // check if iv access ahas been inserted
    
        if(!patient.HasIVAccess)
        {
    	SendDirectMessage("Ti sei dimenticato di dirmi di inserire l'accesso venoso, faccio che farlo da solo va...");
    	Utility.LogWarning("Asked to inject " + medicineName + " but iv access is missing");
    
    	List<ECAAction> actions = new List<ECAAction>();
    
        	IVAccess ivAccess = new IVAccess(this, medicationTable.GetVeinTube(), patient);
        	ivAccess.CompletedAction += OnIvAccessCompleted;
    
    	UseMedicine useMedicine = CreateGetMedicineAction(medicineName);
        	useMedicine.InjectionDone += OnInjectionDone;
    
    	actions.Add(ivAccess);
    	actions.Add(useMedicine);
    
    	ECACompositeAction composite = new ECACompositeAction(this, actions);
    	composite.StartAction();
    
    	return;
        }
    
        // else, inject

        if(State == MedicationProviderState.TakingMedicine || State == MedicationProviderState.MedicineTaken)
        {
            Utility.LogWarning("");
            currentAction.Abort();
            if (State == MedicationProviderState.MedicineTaken)
            { 
                // drop medicine, and enqueue taking medicine
            }
        }
    
        UseMedicine useOnlyMedicine = CreateGetMedicineAction(medicineName);
        useOnlyMedicine.InjectionDone += OnInjectionDone;
        useOnlyMedicine.StartAction();
    }


    private void HandleIVAccess()
    {
        // check if iv access is already on
    
        if(patient.HasIVAccess)
        {
    	SendDirectMessage("Guarda che l'accesso alle vie venose è già stato inserito, che cavolo chiedi?");
    	Utility.LogWarning("Requested IVAccess when it was already in place");
    	return;
        }
    
        // else, execute action
    
        IVAccess ivAccess = new IVAccess(this, medicationTable.GetVeinTube(), patient);
        ivAccess.CompletedAction += OnIvAccessCompleted;
        ivAccess.StartAction();
    }


    private void OnInjectionDone(object sender, EventArgs e)
    {
        UseMedicine useMedicine = (UseMedicine)sender; 
        useMedicine.InjectionDone -= OnInjectionDone;
        UseMedicineEventArgs args = (UseMedicineEventArgs)e;
        Medicine m = args.medicine;
        //send message of completed action
    
        if (m.name == "Epinephrine")
            patient.OnEpinephrineDone();
        else
            patient.OnAmiodaroneDone();
    }


    private void OnIvAccessCompleted(object sender, EventArgs e)
    {
        // changing patient state
    
        patient.OnIvAccessDone();
    }




    protected override void Awake()
    {
        base.Awake();
        medicalRoom = FindObjectOfType<MedicalRoom>();
        destination = FindObjectOfType<DestinationMedicationProvider>();
        patient = FindObjectOfType<Patient>();
    }


    protected override void Start()
    {
        base.Start();
        medicationTable = medicalRoom.GetMedicationTable();
        pole = medicalRoom.GetPole();
    
        //just for debug
        //HandleUseMedicine(MedicineName.Epinephrine);
        //HandleIVAccess(medicationTable.GetVeinTube(), patient);
    }


    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }


    protected UseMedicine CreateGetMedicineAction(MedicineName medicineName)
    {
        Medicine m = medicationTable.GetMedicine(medicineName);
        Assert.IsNotNull(m);
        //send message
        UseMedicine useMedicine = new UseMedicine(this, m);
    
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
