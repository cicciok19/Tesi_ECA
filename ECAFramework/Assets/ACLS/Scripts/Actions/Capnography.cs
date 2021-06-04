using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Capnography : ECAAction
{
    Transform capnography;

    public Capnography(ECA eca, Transform capnography) : base(eca)
    {
        this.capnography = capnography;
    }

    public override void SetupAction()
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
    }

}
