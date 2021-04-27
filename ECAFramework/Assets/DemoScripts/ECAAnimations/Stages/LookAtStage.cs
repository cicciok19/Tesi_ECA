/* File LookAtStage C# implementation of class LookAtStage */



// global declaration start


using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;


// global declaration end

public class LookAtStage : ECAActionStage
{

    protected Transform lookAtObject;

    protected float width; 
    protected float height;

    protected int counter;

    bool wait = false;


    public LookAtStage(Transform lookAtObject) : base()
    {
        this.lookAtObject = lookAtObject;

        width = lookAtObject.GetComponent<MeshRenderer>().bounds.size.x;
        height = lookAtObject.GetComponent<MeshRenderer>().bounds.size.y;
    }




    private void OnWaitComplete(object sender, EventArgs e)
    {
        GameObject newLookObjArray = new GameObject();

        if (counter < 4)
        {
            float newHeight = UnityEngine.Random.Range(-height / 2, height / 2);
            float newWidth = UnityEngine.Random.Range(-width / 2, width / 2);

            newLookObjArray.transform.position = new Vector3(lookAtObject.position.x + newWidth, lookAtObject.position.y + newHeight, lookAtObject.position.z);
            newLookObjArray.transform.rotation = lookAtObject.transform.rotation;
            newLookObjArray.transform.localScale = lookAtObject.transform.localScale;

            ikManager.SetTargetAimIK(ikManager.headIK, newLookObjArray.transform);

            animator.Wait(3f);

            counter++;
        }
        else
        {
            ikManager.SetWeightTargetAimIK(ikManager.headIK, 0);
            ikManager.headIK.solver.target = null;

            counter = 0;
            wait = true;
        }
    }

    public override void EndStage()
    {
        animator.WaitComplete -= OnWaitComplete;
        base.EndStage();
    }


    public override void StartStage()
    {
        base.StartStage();

        counter = 0;

        Utility.Log("LookAtStage started");
        animator.WaitComplete += OnWaitComplete;
        ikManager.SetTargetAimIK(ikManager.headIK, lookAtObject);
        animator.Wait(3f);
    }

    public override void Update()
    {
        base.Update();

        if (ikManager.headIK.solver.IKPositionWeight < .01f && wait)
            EndStage();
    }

}
