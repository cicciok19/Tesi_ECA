/* File Visitor C# implementation of class Visitor */



// global declaration start


using System;
using System.Linq;
using System.Collections.Generic;
using IntentRecognitionResults;
using UnityEngine;
using UnityEngine.Assertions;


// global declaration end

class Visitor : ECA
{
// class declaration start
protected static int counter = 0;
// class declaration end


    protected List<Painting> paintings =      new List<Painting>();


    private void ArrivedAtPainting(object sender, EventArgs e)
    {
        Utility.Log("Visitor " + this.Name + " arrived at destination...");
        Application.Quit();
    }




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
      Assert.IsNotNull(ecaAnimator);
      return ecaAnimator;
    }


    protected void SelectDestinations()
    {
        Painting[] scenePaintings = FindObjectsOfType<Painting>();
    
        if(scenePaintings == null)
        {
            Utility.LogWarning("Visitor " + this.Name + " could not find any painting to see...");
            return;
        }
    
        paintings = scenePaintings.ToList<Painting>();
        
        // shuffle list, tricks from stackoverflow
        paintings = paintings.OrderBy(a => Guid.NewGuid()).ToList();
    
        // just as debug, go to the first painting
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
        TurnStage turn = new TurnStage(painting.GetChairSitPoint(), true);
        SitStageWithIK sit = new SitStageWithIK(painting.GetChairEmpties());
        //CI VUOLE IL LOOK AT STAGE
        WaitStage wait = new WaitStage(6f);
        StandUpStage standUp = new StandUpStage(painting.GetChairSitPoint());
        stages.Add(reachPainting);
        stages.Add(turn);
        stages.Add(sit);
        stages.Add(wait);
        stages.Add(standUp);

        ECAAction newAction = new ECAAction(this, stages);
    
    
        newAction.CompletedAction += ArrivedAtPainting;
        Utility.Log("Visitor " + this.Name + " moving to " + painting.name);
    
        newAction.StartAction();
    }


}
