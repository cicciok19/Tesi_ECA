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

    private SystemManager systemManager;

    protected const string ATTACH_MONITOR = "AttachMonitor";
    protected const string SHOCK = "Shock";
    protected const string CHECK_MONITOR = "AskForRhythm";

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

        systemManager = FindObjectOfType<SystemManager>();

        //HandleShock();
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
        List<string> IntentName = new List<string> {ATTACH_MONITOR, SHOCK, CHECK_MONITOR};

        foreach (string intent in IntentName)
            IntentManager.Instance.AddIntentHandler(intent, this);
    }

    private void HandleShock()
    {
        if (patient.state == PatientState.Asystole)
            Debug.Log("You have to inject Epinephrine, NOT Shock!");

        Shock shock = new Shock(this, defibrillatorTable, patient, 2);
        shock.CompletedAction += OnShockCompleted;
        //actionsList.Enqueue(shock);
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
        actionsList.Enqueue(attachMonitor);
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
        Shock shock = (Shock)sender;
        shock.CompletedAction -= OnShockCompleted;
        systemManager.CheckAction(shock.ActionName);
        
    }

    private void OnMonitorAttached(object sender, EventArgs e)
    {
        AttachMonitor attachMonitor = (AttachMonitor)sender;
        attachMonitor.CompletedAction -= OnMonitorAttached;
        systemManager.CheckAction(attachMonitor.ActionName);
        screen.IsOn = true;
    }

    private void HandleCheckScreen()
    {
        if (!screen.IsOn)
        {
            SendDirectMessage("Il monitor non è attaccato, devo prima attaccarlo per sapere lo stato del paziente!");
            Utility.LogWarning("Asked to check screen but the monitor is not attached.");

            AttachMonitor attachMonitor = new AttachMonitor(this, defibrillatorTable, patient);
            attachMonitor.CompletedAction += OnMonitorAttached;

            CheckMonitor checkScreen = new CheckMonitor(this, defibrillatorTable, patient);
            checkScreen.CompletedAction += OnScreenChecked;

            actionsList.Enqueue(attachMonitor);
            actionsList.Enqueue(checkScreen);
        }
        else
        {
            CheckMonitor checkScreen = new CheckMonitor(this, defibrillatorTable, patient);
            checkScreen.CompletedAction += OnScreenChecked;

            actionsList.Enqueue(checkScreen);
        }
    }

    private void OnScreenChecked(object sender, EventArgs e)
    {
        CheckMonitor checkScreen = (CheckMonitor)sender;
        checkScreen.CompletedAction -= OnScreenChecked;
        systemManager.CheckAction(checkScreen.ActionName);
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
