using System.Collections;
using System.Collections.Generic;
using UnityEngine;

class FirstPaintNode : SequentialNode
{
    public FirstPaintNode(int id, string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode) : base(id, readableName, instructions, childrenNodes, isTrainingMode)
    {
    }

    //mi iscrivo agli eventi che fanno iniziare i vari nodi figli, questo sarebbe solo il SETUP del nodo
    //es. l'utente entra nel trigger del primo quadro e allora faccio partire i vari nodi figli
    //mi iscrivo anche a tutti gli intent che devono essere gestiti e ai relativi messaggi che devo dare all'utente
    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
    }

    //quando viene triggerato l'inizio di questo nodo faccio partire i nodi figli
    protected override void TriggerNode()
    {
        base.TriggerNode();
    }
}
