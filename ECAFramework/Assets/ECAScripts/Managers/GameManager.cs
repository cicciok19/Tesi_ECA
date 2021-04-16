using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.Assertions;

public class GameManager : MonoBehaviour
{

    public event EventHandler<EventArgs> OnGameCompleted;
    public event EventHandler OnGameStarted;
    /// <summary>
    /// I nodi principali dai quali è composta la nostra applicazione
    /// </summary>
    protected GameGraphNode[] nodes = null;
    protected int currentNodeIdx = -1;
    protected DateTime startTime;
    protected DateTime endTime;
    public bool IsPaused = false;
    public bool IsTrainingMode = true;

    protected virtual void Awake()
    {
    }

    public virtual void Init()
    {
        IsPaused = true;
        CreateActions();
        DefineGraphNodes();
        Utility.Log("Game Manager initialized");
    }
    protected virtual void Start()
    {
        StartGame();
    }

    /// <summary>
    /// Creo le smart actions che deve eseguire l'utente per andare avanti nell'applicazione e le aggiungo a AllSmartActions
    /// </summary>
    protected virtual void CreateActions()
    {
    }

    /// <summary>
    /// Definisco i nodi che compongono l'applicazione con le smart actions e li aggiungo a AllSimpleNodes
    /// </summary>
    protected virtual void DefineGraphNodes()
    {
        nodes = new GameGraphNode[]
        {
        };
        
        this.NumberOfNodes = nodes.Length;
    }

    protected virtual void StartGame()
    {
        Assert.IsTrue(nodes.Length > 0);
        currentNodeIdx = 0;
        CurrentNode.StartNode();
        IsPaused = false;
        startTime = DateTime.Now;
        Utility.Log("GAME STARTED!");
        //Utility.Log(CurrentNode.ReadableDescription);
        if (OnGameStarted != null)
            OnGameStarted(this, EventArgs.Empty);
    }

    /// <summary>
    /// Controlla ad ogni update lo stato attuale del nodo in cui mi trovo.
    /// </summary>
    void Update()
    {
        if (!IsPaused && CurrentNode != null)
        {
            //execute current step
            CurrentNode.UpdateNode();

            //if it has finished (with errors or not)
            if (CurrentNode.IsCompleted || CurrentNode.IsAborted)
            {
                //if went ok,switch to next one.
                //if there's no next one, leave the pointer to current
                //node and set current status as completed
                if (CurrentNode.CurrentStatus.ErrorType == GameErrorType.Fine)
                {
                    Utility.Log("Completed state " + CurrentNode.ReadableName);
                    StartNextNode();
                }
                //else, set the error... we'll let the upper manager to decide how to handle the error.
                else
                {
                    Utility.LogWarning(CurrentNode.ReadableName + " error:: " + CurrentNode.CurrentStatus.ErrorString);
                }
            }
            else
            {
                if (CurrentNode.CurrentStatus.ErrorType != GameErrorType.Fine)
                {
                    Utility.LogWarning(CurrentNode.ReadableName + " error:: " + CurrentNode.CurrentStatus.ErrorString);
                }
            }
        }
    }
    void FixedUpdate()
    {
        if (!IsPaused && CurrentNode != null)
        {
            //execute current step
            CurrentNode.FixedUpdateNode();
        }
    }
    protected void StartNextNode()
    {
        currentNodeIdx++;

        if (currentNodeIdx >= nodes.Length)
        {
            StartCoroutine(GameCompleted());
            return;
        }

        CurrentNode.StartNode();
    }
    void OnDestroy()
    {
        foreach (var node in nodes)
            node.DisposeNode();
    }
    
    protected virtual IEnumerator GameCompleted()
    {
        Utility.Log("GAME COMPLETED SIMPLE_MANAGER");
        CompletionManagement();
        yield return null;
    }
    protected void CompletionManagement()
    {
        IsPaused = true;
        ECAManager.Instance.SetEndTime();
        ECAManager.Instance.AvailableEcas[Ecas.Francesca].SendMessage("EndGame");
    }

    public GameGraphNode CurrentNode
    {
        get
        {
            if (currentNodeIdx >= 0 && currentNodeIdx < nodes.Length)
                return nodes[currentNodeIdx];

            return null;
        }
    }
    public int NumberOfNodes { get; protected set; }
    //public ScenarioType GameType { get; protected set; } = ScenarioType.Training;

    protected virtual void createECAActions() { }
}
