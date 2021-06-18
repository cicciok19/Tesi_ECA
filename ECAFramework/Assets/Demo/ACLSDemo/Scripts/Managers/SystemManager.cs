using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public enum NodeName
{
    None,
    Start,
    CheckRythm,
    Shock,
    Cpr,
    CprIv,
    CprEpi,
    CprAmi,
    CprIvEpi,
    End
}

public enum ActionName
{
    AttachMonitor,
    Capnography,
    Cpr,
    GiveOxygen,
    IvAccess,
    Shock,
    CheckRythm,
    UseEpinephrine,
    UseAmiodarone,
    None
}

public class SystemManager: MonoBehaviour
{
    private static SystemManager _instance;

    public static SystemManager Instance { get { return _instance; } }

    Dictionary<NodeName, Node> nodes = new Dictionary<NodeName, Node>();
    List<Node> nodesSequence = new List<Node>();
    Node actualNode;
    GraphManager graphManager;
    Patient patient;

    LogWriter logWriter;

    void Awake()
    {
        if (_instance != null && _instance != this)
        {
            Destroy(this.gameObject);
        }
        else
        {
            _instance = this;
        }

        patient = FindObjectOfType<Patient>();
        SetNodes();
        SetGraph();
        actualNode = nodes[NodeName.Start];
        nodesSequence.Add(actualNode);

        logWriter = GetComponent<LogWriter>();
    }

    public void CheckAction(ActionName actionDone)
    {
        if (actualNode.IsCorrectAction(actionDone))
        {
            if(actionDone != ActionName.CheckRythm || actionDone != ActionName.AttachMonitor || actionDone != ActionName.IvAccess)
                patient.StateLevel += 0.1f;
            Debug.Log("Correct Action!");
        }
        else
        {
            Node successive = graphManager.CheckWrongAdvance(actionDone, actualNode.NodeName, nodesSequence);

            if (successive != null)
            {
                patient.StateLevel -= (float)actualNode.incompleteActions.Count * 0.05f;
                actualNode.Finished = true;
                actualNode = successive;
                nodesSequence.Add(actualNode);
                actualNode.IsCorrectAction(actionDone);

                Debug.Log("Ti sei dimenticato di fare delle azioni nel nodo precedente");
            }
            else
                patient.StateLevel -= .5f;

        }

        if (actualNode.Finished)
        {
            NodeName newNode = graphManager.GetNewNode(actualNode.NodeName, nodesSequence);
            actualNode = nodes[newNode];
            nodesSequence.Add(actualNode);
        }

    }

    private void SetNodes()
    {
        Node nodeStart = new Node(NodeName.Start, new List<ActionName>
        {
            ActionName.Cpr,
            ActionName.GiveOxygen,
            ActionName.AttachMonitor
        });
        nodes.Add(NodeName.Start, nodeStart);

        Node checkRythm = new Node(NodeName.CheckRythm, new List<ActionName>
        {
            ActionName.CheckRythm
        });
        nodes.Add(NodeName.CheckRythm, checkRythm);

        Node shock = new Node(NodeName.Shock, new List<ActionName>
        {
            ActionName.Shock
        });
        nodes.Add(NodeName.Shock, shock);

        Node ivAccess = new Node(NodeName.CprIv, new List<ActionName>
        {
            ActionName.Cpr,
            ActionName.IvAccess
        });
        nodes.Add(NodeName.CprIv, ivAccess);

        Node epi = new Node(NodeName.CprEpi, new List<ActionName>
        {
            ActionName.Cpr,
            ActionName.UseEpinephrine,
            ActionName.Capnography
        });
        nodes.Add(NodeName.CprEpi, epi);

        Node ami = new Node(NodeName.CprAmi, new List<ActionName>
        {
            ActionName.Cpr,
            ActionName.UseAmiodarone
        });
        nodes.Add(NodeName.CprAmi, ami);

        Node ivEpi = new Node(NodeName.CprIvEpi, new List<ActionName> 
        {
            ActionName.IvAccess,
            ActionName.Cpr,
            ActionName.UseEpinephrine,
            ActionName.Capnography
        });
        nodes.Add(NodeName.CprIvEpi, ivEpi);

        Node cpr = new Node(NodeName.Cpr, new List<ActionName>
        {
            ActionName.Cpr
        });
        nodes.Add(NodeName.Cpr, cpr);

        Node end = new Node(NodeName.End, new List<ActionName> 
        {
            ActionName.None
        });
        nodes.Add(NodeName.End, end);
    }

    
    private void SetGraph()
    {
        graphManager = new GraphManager(nodes, patient);

        graphManager.SetSuccessiveNodes(nodes[NodeName.Start],new List<NodeName>
        {
            NodeName.CheckRythm
        });

        graphManager.SetSuccessiveNodes(nodes[NodeName.CheckRythm], new List<NodeName>
        {
            NodeName.Shock,
            NodeName.CprIvEpi,
            NodeName.Cpr
        });

        graphManager.SetSuccessiveNodes(nodes[NodeName.CprIv], new List<NodeName>
        {
            NodeName.CheckRythm
        });

        graphManager.SetSuccessiveNodes(nodes[NodeName.Shock], new List<NodeName>
        {
            NodeName.CprIv,
            NodeName.CprEpi,
            NodeName.CprAmi
        });

        graphManager.SetSuccessiveNodes(nodes[NodeName.CprAmi], new List<NodeName>
        {
            NodeName.CheckRythm
        });

        graphManager.SetSuccessiveNodes(nodes[NodeName.CprIvEpi], new List<NodeName>
        {
            NodeName.CheckRythm
        });

        graphManager.SetSuccessiveNodes(nodes[NodeName.Cpr], new List<NodeName>
        {
            NodeName.CheckRythm
        });
    }

    public string actualNodeName
    {
        get
        {
            return actualNode.NodeName.ToString();
        }
    }
    
}
