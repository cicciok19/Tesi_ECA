using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CheckScreen : ECAAction
{
    protected new ActionName actionName = ActionName.CheckRythm;

    public CheckScreen(ECA eca, ECAActionStage stage, bool canAbort = true) : base(eca, stage, canAbort)
    {
    }
}
