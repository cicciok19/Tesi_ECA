/* File ECACompositeAction C# implementation of class ECACompositeAction */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using System;


// global declaration end

public class ECACompositeAction : ECAAction
{

    protected List<ECAAction> actions = new List<ECAAction>();
    protected int actualActionIdx = 0;


    public ECACompositeAction(ECA eca)
    :base(eca)
    {
    }




    protected void Attach(ECAAction action)
    {
        action.CompletedAction += OnActualActionCompleted;
    }


    protected void Detach(ECAAction action)
    {
        action.CompletedAction -= OnActualActionCompleted;
    }


    protected virtual void OnActualActionCompleted(object sender, EventArgs e)
    {
        CompleteAndAdvance();
    }


    protected virtual void NextAction()
    {
        if (ActualAction != null)
        {
            //iscrivo l'azione all'evento che segnala la fine dello stage
            Attach(ActualAction);
            ActualAction.StartAction();
        }
        else
            OnCompletedAction();
    }


    protected void CompleteAndAdvance()
    {
        Detach(ActualAction);
        actualActionIdx++;
        NextAction();
    }




    public override void StartAction()
    {
        if (actions.Count != 0)
        {
            if(ActualAction != null)
            {
    		if(ecaAnimator.actualAction != null && 
    		(ecaAnimator.actualAction.State == ActionState.Running || ecaAnimator.actualAction.State == ActionState.Paused))
    			  ecaAnimator.actualAction.Abort();
    
    		Attach(ActualAction);	
    		ecaAnimator.actualAction = ActualAction;
    
    		
    		State = ActionState.Running;
    		ActualAction.StartAction();
            }
        }
    }


    public ECAAction ActualAction
    {
        get
        {
            if (actualActionIdx >= 0 && actualActionIdx < actions.Count)
                return actions[actualActionIdx];
    
            return null;
        }
    }


}
