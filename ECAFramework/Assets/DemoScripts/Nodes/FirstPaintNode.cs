using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

class PaintSequentialNode : SequentialNode
{
    public PaintSequentialNode(string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode) : 
        base(readableName, instructions, childrenNodes, isTrainingMode)
    {

    }

    //mi iscrivo agli eventi che fanno iniziare i vari nodi figli, questo sarebbe solo il SETUP del nodo
    //es. l'utente entra nel trigger del primo quadro e allora faccio partire i vari nodi figli
    //mi iscrivo anche a tutti gli intent che devono essere gestiti e ai relativi messaggi che devo dare all'utente
    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
        UpdateNode();
        //CurrentNode.OnCompleted += onChildrenCompleted;
    }

    //quando viene triggerato l'inizio di questo nodo faccio partire i nodi figli
    protected override void TriggerNode()
    {
        base.TriggerNode();
    }

    public void OnChildrenCompleted(object sender, EventArgs e)
    {
        StartNextNode();
        if(CurrentNode != null)
            CurrentNode.OnCompleted += OnChildrenCompleted;
    }

}
