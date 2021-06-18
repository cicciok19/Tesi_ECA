using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GraphManager : MonoBehaviour
{
    Dictionary<Node, List<NodeName>> parentNodes = new Dictionary<Node, List<NodeName>>();
    Dictionary<NodeName, Node> nodes = new Dictionary<NodeName, Node>();
    Patient patient;
    LogWriter logWriter;

    public GraphManager(Dictionary<NodeName, Node> nodes, Patient patient, LogWriter logWriter = null)
    {
        this.nodes = nodes;
        this.patient = patient;
    }

    public void SetSuccessiveNodes(Node node, List<NodeName> successiveNodes)
    {
        parentNodes.Add(node, successiveNodes);
    }

    public List<NodeName> GetSuccessiveNodes(Node node)
    {
        return parentNodes[node];
    }

    private NodeName GetSuccessiveRythmNode(List<Node> precedentNodes)
    {
        if(precedentNodes.Count -1 == 1)
        {
            if (patient.state == PatientState.Asystole)
                return NodeName.CprIvEpi;
            else if (patient.state == PatientState.VF)
                return NodeName.Shock;
            else
                return NodeName.None;
        }
        else
        {
            if (patient.state == PatientState.Asystole)
                return NodeName.Cpr;
            else if (patient.state == PatientState.VF)
                return NodeName.Shock;
            else if (patient.state == PatientState.Ok)
                return NodeName.End;
            else
                return NodeName.None;
        }
    }

    private NodeName GetSuccessiveShock(List<Node> precedentNodes)
    {
        if (precedentNodes.Count - 1 == 2)
            return NodeName.CprIv;
        else
        {
            if (precedentNodes[precedentNodes.Count - 3].NodeName == NodeName.CprEpi)
                return NodeName.CprAmi;
            else
                return NodeName.CprEpi;
        }
    }

    public NodeName GetNewNode(NodeName nodeName, List<Node> precedentNodes)
    {
        if (nodeName == NodeName.Start || nodeName == NodeName.CprIv || nodeName == NodeName.CprAmi || nodeName == NodeName.CprEpi || nodeName == NodeName.CprIvEpi || nodeName == NodeName.Cpr)
            return NodeName.CheckRythm;
        else if (nodeName == NodeName.CheckRythm)
            return GetSuccessiveRythmNode(precedentNodes);
        else if (nodeName == NodeName.Shock)
            return GetSuccessiveShock(precedentNodes);
        else
            return NodeName.None;
    }

    public Node CheckWrongAdvance(ActionName actionDone, NodeName actualNode, List<Node> precedentNodes)
    {
        if (actualNode == NodeName.Start || actualNode == NodeName.CprIv || actualNode == NodeName.CprAmi ||
            actualNode == NodeName.CprEpi || actualNode == NodeName.CprIvEpi || actualNode == NodeName.Cpr)
        {
            NodeName successive = NodeName.CheckRythm;
            Node node = nodes[successive];

            if (node.IsCorrectAction(actionDone))
                return node;
            else
                return null;
        }
        else if (actualNode == NodeName.CheckRythm)
        {
            NodeName successive = GetSuccessiveRythmNode(precedentNodes);
            Node node = nodes[successive];

            if (node.IsCorrectAction(actionDone))
                return node;
            else
                return null;
        }
        else if (actualNode == NodeName.Shock)
        {
            NodeName successive = GetSuccessiveShock(precedentNodes);
            Node node = nodes[successive];

            if (node.IsCorrectAction(actionDone))
                return node;
            else
                return null;
        }
        else
        {
            Debug.LogError("The node doesn't exist");
            return null;
        }

    }
}
