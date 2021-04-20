/* File Visitor C# implementation of class Visitor */



// global declaration start


using System;
using System.Collections.Generic;
using IntentRecognitionResults;
using UnityEngine;


// global declaration end

class Visitor : ECA
{
// class declaration start
protected static int counter = 0;
// class declaration end


    protected List<Painting> paintings =  new List<Painting>();


    protected override void Awake()
    {
        base.Awake();
    }


    protected override void Start()
    {
      base.Start();
    
      SelectDestinations();
    }


    protected override ECAAnimator AddECAAnimator()
    {
      // component should be added to GO
      ECAAnimatorMxM ecaAnimator = GetComponent<ECAAnimatorMxM>();
      UnityEngine.Assertions.Assert.IsNotNull(ecaAnimator);
      return ecaAnimator;
    }


    protected void SelectDestinations()
    {
        Painting[] scenePaintings = FindObjectsOfType<Painting>();
    
        foreach (var paint in scenePaintings)
            this.paintings.Add(paint);
    
        GoToPainting(paintings[0]);
    }




    public override void SetEcaId()
    {
        ID = Ecas.Default;
    }


    public void GoToPainting(Painting painting)
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage reachPainting = new GoToStage(painting.GetChairDestination());
        stages.Add(reachPainting);
        ECAAction newAction = new ECAAction(ecaAnimator, stages);
        newAction.StartAction();

    }


}
