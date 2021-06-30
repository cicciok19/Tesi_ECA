using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using CrazyMinnow.SALSA;
using DG.Tweening;

public class ConversationalPatient : ECA
{
    private const string BAD_NEW = "BadNew";
    private const string CHILDREN = "Children";
    private const string CURE = "Cure";
    private const string EXPLAIN_DISEASE = "ExplainDisease";
    private const string GENERAL_HEALTH = "GeneralHealth";
    private const string PRESENTATION = "Presentation";
    private const string WEATHER = "Weather";
    private const string NONE = "None";

    public SittableObject chair;
    public bool Sitted { get; protected set; } = false;
    private ECAAction sitAction;

    public Transform Target;
    protected GameObject emotionWheel;
    protected GameObject pin;
    protected Transform indicator;
    protected float indicatorInitialScale = 0f;

    Color[] emotionToColor = new Color[] {
    Color.yellow,
    new Color( 172/255.0f, 211/255f, 106/255f),
    new Color( 47/255.0f, 183/255f, 116/255f),
    new Color( 44/255.0f, 175/255f, 217/255f),
    new Color( 116/255.0f, 168/255f, 219/255f),
    new Color( 164/255.0f, 145/255f, 197/255f),
    new Color( 242/255.0f, 114/255f, 109/255f),
    new Color( 250/255.0f, 174/255f, 101/255f),
    new Color( 0/255.0f, 0/255f, 0/255f)
};


    protected override void Start()
    {
        base.Start();

        //send message greetings (and trigger animation, if you want to
        chair = FindObjectOfType<SittableObject>();
       /* sitAction = Sit();
        actionsList.Enqueue(sitAction);*/
        actionsList.Enqueue(new ECAAction(this, new LookStableStage(ecaAnimator.camera.transform, 1)));
        //SendMessageRequest(PRESENTATION);

        emotionWheel = FindObjectOfType<Wheel>().gameObject;
        if (emotionWheel == null)
            Utility.LogError("Emotion Wheel NOT FOUND");

        pin = FindObjectOfType<Pin>().gameObject;
        if (pin == null)
            Utility.LogError("pin NOT FOUND");


        indicator = pin.transform.GetChild(0).transform;
        indicatorInitialScale = indicator.localScale.y;

        EmotionManager.ActualEmotionChanged += ECAEmotionChanged;
        EmotionManager.ActualEmotionUpdated += ECAEmotionChanged;
        InitPatientEmotion();
    }

    private void Update()
    {
        pin.transform.LookAt(Target);
        //just for debug
        if(Input.GetKeyDown(KeyCode.C))
            SendMessage(CHILDREN);
        if (Input.GetKeyDown(KeyCode.E))
            SendMessage(EXPLAIN_DISEASE);
        //try with TTS client
        if (Input.GetKeyDown(KeyCode.Space))
            SendDirectMessage("Hello doctor, my name is Sophie");
    }


    protected void InitPatientEmotion()
    {
        /*
        AvailableEmotions actualEmotion = (AvailableEmotions)(UnityEngine.Random.Range(
          0, (int)AvailableEmotions.None));

        float strength = UnityEngine.Random.Range(ECAEmotion.MinValue, ECAEmotion.MaxValue);
        */
        EmotionManager.InitActualEmotion(EmotionManager.ActualEmotion.EmotionType, EmotionManager.ActualEmotion.Value);
        ShowEmotion();
        //SetAvatarColor();
    }

    public override void SetEcaId()
    {
        base.SetEcaId();
        ID = Ecas.HospitalPatient;
    }

    protected override ECAAnimator AddECAAnimator()
    {
        return gameObject.AddComponent<ECAAnimatorMxM>();
    }

    public override void Handle(Intent intent)
    {
        base.Handle(intent);

        switch (intent.IntentName)
        {
            //change emotion based on the intent
            case BAD_NEW:
                EmotionManager.UpdateEmotion(AppraisalVariables.UnexpectedNegative);
                break;
            case CHILDREN:
                EmotionManager.UpdateEmotion(AppraisalVariables.Nice);
                break;
            case EXPLAIN_DISEASE:
                EmotionManager.UpdateEmotion(AppraisalVariables.Good, .2f);
                break;
            case PRESENTATION:
                EmotionManager.UpdateEmotion(AppraisalVariables.Nice, .3f);
                break;
            case CURE:
                EmotionManager.UpdateEmotion(AppraisalVariables.Good, .5f);
                break;
            case GENERAL_HEALTH:
                break;
            case NONE:
                break;
        }

        //then send message
        SendMessage(intent.IntentName);


    }

    protected void ECAEmotionChanged(object sender, EventArgs args)
    {
        AvailableEmotions actualEmotion = EmotionManager.ActualEmotion.EmotionType;
        float strength = EmotionManager.ActualEmotion.NormalizedValue;

        //SetAvatarColor();
        ShowEmotion();
    }

    public override void SubscribeHandlerToIntentManager()
    {
        List<string> intentName = new List<string> { BAD_NEW, CHILDREN, CURE, EXPLAIN_DISEASE, GENERAL_HEALTH, PRESENTATION, WEATHER, NONE};     //fill list

        foreach (var intent in intentName)
            IntentManager.Instance.AddIntentHandler(intent, this);

    }

    protected override void HandleMessageAction(EmotionalMessage message)
    {
        if (message.action == "")
            return;

        // serving action
        //MessageAction action = message.parsedAction;
        List<MessageAction> actions = message.parsedActions;
        actionsList.Enqueue(new ECAAction(this, new LookStableStage(ecaAnimator.camera.transform, 0)));

        for (int i = 0; i < actions.Count; i++)
        {
            MessageAction action = actions[i];
            ECAAction ecaAction = null;

            if (action.IsMoveTo())
            {
                float random = UnityEngine.Random.Range(0f, 1f);

                if (action.probability >= random)
                {
                    Utility.Log("Going to " + action.firstParameter);
                    ecaAction = new GoToAction(this, action);
                    actionsList.Enqueue(ecaAction);
                }
            }

            if (action.IsPickUp())
            {
                float random = UnityEngine.Random.Range(0f, 1f);

                if (action.probability >= random)
                {
                    Utility.Log("Picking up " + action.firstParameter);
                    ecaAction = new PickUpAction(this, action);
                    actionsList.Enqueue(ecaAction);
                }
            }

            if(action.IsPointAt())
            {
                float random = UnityEngine.Random.Range(0f, 1f);

                if (action.probability >= random)
                {
                    Utility.Log("Pointing at " + action.firstParameter);
                    ecaAction = new PointAtAction(this, action);
                    actionsList.Enqueue(ecaAction);
                }
            }

            if (action.IsSit())
            {
                float random = UnityEngine.Random.Range(0f, 1f);

                if (action.probability >= random)
                {
                    Utility.Log("Sit down");
                    ecaAction = Sit();
                    Sitted = true;
                }
            }



            Assert.IsNotNull(ecaAction, "MessageAction is not referred to a valid action");
            if (Sitted)
                actionsList.Enqueue(Sit());
            else
                actionsList.Enqueue(new ECAAction(this, new TurnStage(ecaAnimator.camera.transform)));
            actionsList.Enqueue(new ECAAction(this, new LookStableStage(ecaAnimator.camera.transform, 1)));
        }
    }

    private ECAAction Sit()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage reachChair = new GoToStage(chair.GetDestination(), null, false);
        TurnStage turn = new TurnStage(chair.GetSitPoint(), true);
        WaitStage wait = new WaitStage(.6f);
        SitStage sit = new SitStage(chair);
        stages.Add(reachChair);
        stages.Add(wait);
        stages.Add(turn);
        stages.Add(sit);

        ECAAction action = new ECAAction(this, stages);
        return action;
    }

    protected void ShowEmotion()
    {
        Utility.Log("Setting " + name + " emotion to " + EmotionManager.ActualEmotion.EmotionType + " with " + EmotionManager.ActualEmotion.NormalizedValue);
        //transform.localScale = initialScale * EmotionManager.ActualEmotion.NormalizedValue;

        Utility.Log("Targets = " + emotionWheel.transform.GetChild(0).name + " Emotion target = " + emotionWheel.transform.GetChild(0).GetChild((int)EmotionManager.ActualEmotion.EmotionType).gameObject.name);

        Transform target = emotionWheel.transform.GetChild(0).GetChild((int)EmotionManager.ActualEmotion.EmotionType).gameObject.transform;
        //pin.transform.LookAt(target);
        //indicator.localScale = new Vector3(indicator.localScale.x, indicatorInitialScale*(1 + EmotionManager.ActualEmotion.NormalizedValue), indicator.localScale.z);

        indicator.DOScaleY(indicatorInitialScale * (1 + 1.5f * EmotionManager.ActualEmotion.NormalizedValue), 2f);
        Target.DOMove(target.position, 2f);
    }

}
