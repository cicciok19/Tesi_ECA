/* File LookAtStage C# implementation of class LookAtStage */

/*      CG&VG group @ Politecnico di Torino               */
/*              All Rights Reserved	                      */
/*                                                        */
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */
/*  The copyright notice above does not evidence any      */
/*  actual or intended publication of such source code.   */


// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;


// global declaration end

public class LookAtStage : ECAActionStage
{

    protected Transform lookAtObject;
    protected int counter;
    protected LookableObject lookableObject;


    public LookAtStage(LookableObject lookableObject)
    : base()
    {
            this.lookableObject = lookableObject;
    
    	counter = (int)Mathf.Round(UnityEngine.Random.Range(2f ,5f));
    
    }




    private void OnAimCompleted(object sender, EventArgs e)
    {
      WaitFor(UnityEngine.Random.Range(0f, 3.0f));
    }




    protected override void OnWaitCompleted()
    {   
        if(counter == 0)
        {
    	EndStage();
    	return;
        }
    
    
        counter--;
        ikManager.SetTargetAimIK(ikManager.headIK, lookableObject.GetRandomLookPosition());
    }




    public override void EndStage()
    {
        base.EndStage();
        ikManager.RemoveTarget(ikManager.headIK);
        
    }


    public override void StartStage()
    {
        base.StartStage();
    
        Utility.Log("LookAtStage started");
        ikManager.AimCompleted += OnAimCompleted;
        ikManager.SetTargetAimIK(ikManager.headIK, lookableObject.GetLookPosition());
    }


}
