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
    
    private int idxPaint;

    protected List<Painting> paintings = new List<Painting>();
    protected ECAAction action =  null;

    // class declaration end

    protected override void Awake()
    {
        base.Awake();
    }


    protected override void Start()
    {
        base.Start();
    
        idxPaint = 0;
        SelectDestinations();
    }


    protected override void CreateAnimator()
    {
        ecaAnimator = GetComponent<ECAAnimatorMxM>();
        if (ecaAnimator == null)
            ecaAnimator = gameObject.AddComponent<ECAAnimatorMxM>();
        Assert.IsNotNull(ecaAnimator);
    
        ecaAnimator.Init();
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
        GoToPainting(paintings[idxPaint]);
    }

    private void OnEndPaintVisit(object sender, EventArgs e)
    {
        Utility.Log("Visitor " + this.Name + " visited paint " + paintings[idxPaint].id);

        //free the paint
        paintings[idxPaint].chair.SittableBusy -= OnChairBusy;
        paintings[idxPaint].chair.SittableFree -= OnChairFree;

        idxPaint++;

        if (paintings.Count > idxPaint)
        {
            //then visit paint
            GoToPainting(paintings[idxPaint]);
        }
        else
        {
            Utility.Log("END OF APPLICATION");
            action = null;
        }
    }


    public void OnChairBusy(object sender, EventArgs e)
    {
        Utility.Log("Visitor " + this.Name + " going to " + sender + " that becomes busy");
        Painting painting = paintings[idxPaint];

        painting.chair.SittableBusy -= OnChairBusy;
        painting.chair.SittableFree -= OnChairFree;

        GoToStage reachPainting = new GoToStage(painting.GetLookableObject());
        reachPainting.StopDistance = 5f;
        LookAtStage lookAt = new LookAtStage(painting.GetLookableObject());

        List<ECAActionStage> stages = new List<ECAActionStage>();
        stages.Add(reachPainting);
        stages.Add(lookAt);

        action.Abort();

        action = new ECAAction(this, stages);
        action.CompletedAction += OnEndPaintVisit;

        action.StartAction();
    }


    private void OnChairFree(object sender, EventArgs e)
    {
        Utility.Log("Visitor " + this.Name + " going to " + sender + " that becomes free");
    }

    public void GoToPainting(Painting painting)
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage reachPainting = new GoToStage(painting.GetChairDestination());
        TurnStage turn = new TurnStage(painting.GetChairSitPoint(), true);
        SitStage sit = new SitStage(painting.chair);
        LookAtStage lookAt = new LookAtStage(painting.GetLookableObject());
        StandUpStage standUp = new StandUpStage(painting.chair);


        painting.chair.SittableBusy += OnChairBusy;
        painting.chair.SittableFree += OnChairFree;

        stages.Add(reachPainting);
        stages.Add(turn);
        stages.Add(sit);
        stages.Add(lookAt);
        stages.Add(standUp);

        ECAAction newAction = new ECAAction(this, stages);
        action = newAction;


        newAction.CompletedAction += OnEndPaintVisit;
        Utility.Log("Visitor " + this.Name + " moving to " + painting.name);

        newAction.StartAction();

        Invoke("OccupyChair", 1.0f);
    }


    protected void OccupyChair()
    {
        paintings[idxPaint].chair.Occupied = true;
    }




    public override void Init()
    {
        base.Init();
    }


    public override void SetEcaId()
    {
        ID = Ecas.Default;
    }


    

    public override void DetachEvent(string handlerName, EventArgs args)
    {
        if (handlerName == "SittableBusy")
            paintings[idxPaint].chair.SittableBusy -= OnChairBusy;
        if(handlerName == "SittableFree")
            paintings[idxPaint].chair.SittableFree -= OnChairFree;
    }


}
