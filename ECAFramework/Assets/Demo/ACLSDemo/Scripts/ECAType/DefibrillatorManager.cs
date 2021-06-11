using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class DefibrillatorManager : ECA
{
    public event EventHandler ShockCompleted;

    private MedicalRoom room;
    private DefibrillatorTable defibrillatorTable;
    private Patient patient;
    private DefibrillatorScreen screen;

    private HoldPointLeft holdPointLeft;
    private HoldPointRight holdPointRight;

    protected const string ATTACH_MONITOR = "Attach monitor";
    protected const string SHOCK = "Shock";
    protected const string CHECK_MONITOR = "CheckMonitor";

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    protected override void Start()
    {
        base.Start();
        room = FindObjectOfType<MedicalRoom>();
        patient = FindObjectOfType<Patient>();
        defibrillatorTable = room.GetDefibrillatorTable();
        screen = defibrillatorTable.GetDefibrillator().GetScreen();

        holdPointLeft = GetComponentInChildren<HoldPointLeft>();
        holdPointRight = GetComponentInChildren<HoldPointRight>();

        HandleShock();
        //HandleAttachMonitor();
        //HandleCheckScreen();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);

        switch (intent.IntentName)
        {
            case ATTACH_MONITOR:
                HandleAttachMonitor();
                break;
            case SHOCK:
                HandleShock();
                break;
            case CHECK_MONITOR:
                HandleCheckScreen();
                break;
        }
    }

    public override void SubscribeHandlerToIntentManager()
    {
        List<string> IntentName = new List<string> {ATTACH_MONITOR, SHOCK};

        foreach (string intent in IntentName)
            IntentManager.Instance.AddIntentHandler(intent, this);
    }

    private void HandleShock()
    {
        if (patient.state == PatientState.Asystole)
            Debug.Log("You have to inject Epinephrine, NOT Shock!");

        Shock shock = new Shock(this, defibrillatorTable, patient, 2);
        //shock.CompletedAction += OnShockReady;
        shock.StartAction();
    }

    private void HandleAttachMonitor()
    {
        if (screen.IsOn)
        {
            SendDirectMessage("Lo schermo è già accesso!");
            return;
        }

        AttachMonitor attachMonitor = new AttachMonitor(this, defibrillatorTable, patient);
        attachMonitor.CompletedAction += OnMonitorAttached;
        attachMonitor.StartAction();
    }

  /*  private void OnShockReady(object sender, EventArgs e)
    {
        Shock shock = (Shock)sender;
        SendDirectMessage("Scarica!");
        shock.CompletedAction -= OnShockReady;
        patient.Shocked += OnShockCompleted;
        patient.OnShockReceived();
    }
  */
    private void OnShockCompleted(object sender, EventArgs e)
    {
        //ci dovrebbe essere un check su quanti shock si debbano fare perché per ora è solo uno


        
    }

    private void OnMonitorAttached(object sender, EventArgs e)
    {
        AttachMonitor attachMonitor = (AttachMonitor)sender;
        attachMonitor.CompletedAction -= OnMonitorAttached;
        screen.IsOn = true;
    }

    private void HandleCheckScreen()
    {
        if (!screen.IsOn)
        {
            SendDirectMessage("Il monitor non è attaccato, devo prima attaccato per sapere lo stato del paziente!");
            Utility.LogWarning("Asked to check screen but the monitor is not attached.");

            List<ECAAction> actions = new List<ECAAction>();

            AttachMonitor attachMonitor = new AttachMonitor(this, defibrillatorTable, patient);
            attachMonitor.CompletedAction += OnMonitorAttached;

            CheckScreenStage checkScreenStage = new CheckScreenStage(this, patient.state);
            ECAAction checkScreen = new ECAAction(this, checkScreenStage);

            actions.Add(attachMonitor);
            actions.Add(checkScreen);

            ECACompositeAction composite = new ECACompositeAction(this, actions);
            composite.StartAction();
        }
        else
        {
            CheckScreenStage checkScreenStage = new CheckScreenStage(this, patient.state);
            ECAAction checkScreen = new ECAAction(this, checkScreenStage);

            checkScreen.StartAction();
        }
    }

    public Transform GetHoldPointLeft()
    {
        return holdPointLeft.transform;
    }

    public Transform GetHoldPointRight()
    {
        return holdPointRight.transform;
    }
}
