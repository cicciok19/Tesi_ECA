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


    public LookAtStage(Transform lookAtObject) : base()
    {
        this.lookAtObject = lookAtObject;

        width = lookAtObject.GetComponent<MeshRenderer>().bounds.size.x;
        height = lookAtObject.GetComponent<MeshRenderer>().bounds.size.y;
    }




    private void OnWaitComplete(object sender, EventArgs e)
    {
        if (counter < 4)
        {
            GameObject newLookObj = new GameObject();

            float newHeight = UnityEngine.Random.Range(-height / 2, height / 2);
            float newWidth = UnityEngine.Random.Range(-width / 2, width / 2);

            newLookObj.transform.position = new Vector3(lookAtObject.position.x + newWidth, lookAtObject.position.y + newHeight, lookAtObject.position.z);
            newLookObj.transform.rotation = lookAtObject.transform.rotation;
            newLookObj.transform.localScale = lookAtObject.transform.localScale;

            ikManager.SetTargetAimIK(ikManager.headIK, newLookObj.transform);

            animator.Wait(3f);

            counter++;
        }
        else
        {
            EndStage();
        }
    }

    public override void EndStage()
    {
        ikManager.SetWeightTargetAimIK(ikManager.headIK, 0);
        counter = 0;

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
    }

}
