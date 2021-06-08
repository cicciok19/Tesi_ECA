/* File Visitor C# implementation of class Visitor */

/*      CG&VG group @ Politecnico di Torino               */
/*              All Rights Reserved	                      */
/*                                                        */
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */
/*  The copyright notice above does not evidence any      */
/*  actual or intended publication of such source code.   */


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


    private int idxPaint;

    protected List<Painting> paintings =  new List<Painting>();
    protected List<LandingAreaCircular> landingAreas = new List<LandingAreaCircular>();
    protected ECAAction action =   null;

    protected GrabbableObject grabbable;
    protected LandingAreaCircular landing;


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


    private void OnChairFree(object sender, EventArgs e)
    {
        Utility.Log("Visitor " + this.Name + " going to " + sender + " that becomes free");
    }




    protected override void Awake()
    {
        base.Awake();
    }


    protected override void Start()
    {
        base.Start();
    
        idxPaint = 0;
        //SelectDestinations();
        grabbable = GameObject.FindObjectOfType<GrabbableObject>();
        PickUp(grabbable);
        //Landing();

        //ManageLandingArea landing = new ManageLandingArea(this);
        //landing.StartAction();
        
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
        // paintings = paintings.OrderBy(a => Guid.NewGuid()).ToList();
    
        // just as debug, go to the first painting
        GoToPainting(paintings[idxPaint]);
    }


    protected void OccupyChair()
    {
        paintings[idxPaint].chair.Occupied = true;
    }




    public override void Init()
    {
        base.Init();
    }


    public void PickUp(GrabbableObject grabbable)
    {
        Transform dropPosition = GameObject.FindObjectOfType<DropPosition>().transform;
        Transform destination = GameObject.FindObjectOfType<Destination>().transform;
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage reachGrab = new GoToStage(destination);
        PickStage pick = new PickStage(grabbable.transform, .3f, true, HandSide.RightHand);
        DropStage drop = new DropStage(pick);

        stages.Add(reachGrab);
        stages.Add(pick);
        //stages.Add(drop);
        ECAAction newAction = new ECAAction(this, stages);
        newAction.StartAction();
    }


    /*protected void Landing()
    {
        landingAreas = FindObjectsOfType<LandingAreaCircular>().ToList();
        if(landing == null)
            landing = new LandingAreaCircular();

        foreach (LandingAreaCircular landingAreaC in landingAreas)
        {
            if (landingAreaC.transform.childCount == 0)
            {
                landing = landingAreaC;
            }
        }
        lock (landing)
        {
            if (landing.full)
            {
                while (landing.full)
                {
                    if (landing.transform.parent != null)
                        if (landing.transform.parent.GetComponent<LandingAreaCircular>())
                        {
                            landing = landing.transform.parent.GetComponent<LandingAreaCircular>();
                            if (!landing.full)
                                break;
                        }
                }
            }

            landing.EcaIn++;
            GoToLanding(landing);
        }
    }

    public void GoToLanding(LandingAreaCircular landingArea)
    {
        landing = landingArea;

        List<ECAActionStage> stages = new List<ECAActionStage>();
            
        Vector3 landingPosition_1 = Randomize.GetRandomPositionRound(landingArea.gameObject, landingArea.innerRadius, landingArea.radius);
        GoToStage goTo_1 = new GoToStage(landingPosition_1);

        stages.Add(goTo_1);

        ECAAction newAction = new ECAAction(this, stages);
        newAction.StartAction();
        
    }
    */

    public void GoToPainting(Painting painting)
    {
        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage reachPainting = new GoToStage(painting.GetChairDestination());
        TurnStage turn = new TurnStage(painting.GetChairSitPoint(), true);
        SitStage sit = new SitStage(painting.chair);
        LookAtStage lookAt = new LookAtStage(painting.GetLookableObject());
        StandUpStage standUp = new StandUpStage(painting.chair);
        //PointAtStage pointAt = new PointAtStage(painting.GetLookableObject(), 3f);
    
    
        painting.chair.SittableBusy += OnChairBusy;
        painting.chair.SittableFree += OnChairFree;
    
        stages.Add(reachPainting);
        stages.Add(turn);
        stages.Add(sit);
        stages.Add(lookAt);
        stages.Add(standUp);
        //stages.Add(pointAt);
    
        ECAAction newAction = new ECAAction(this, stages);
        action = newAction;
    
    
        newAction.CompletedAction += OnEndPaintVisit;
        Utility.Log("Visitor " + this.Name + " moving to " + painting.name);
    
        newAction.StartAction();
    
        Invoke("OccupyChair", 1.0f);
    }


    public void OnChairBusy(object sender, EventArgs e)
    {
        Utility.Log("Visitor " + this.Name + " going to " + sender + " that becomes busy");
        Painting painting = paintings[idxPaint];
    
        painting.chair.SittableBusy -= OnChairBusy;
        painting.chair.SittableFree -= OnChairFree;
    
        GoToStage reachPainting = new GoToStage(painting.GetLookableObject());
        reachPainting.StopDistance = 2.5f;
        LookAtStage lookAt = new LookAtStage(painting.GetLookableObject());
        PointAtStage pointAt = new PointAtStage(painting.GetLookableObject(), 3f);
    
        List<ECAActionStage> stages = new List<ECAActionStage>();
        stages.Add(reachPainting);
        stages.Add(pointAt);
        stages.Add(lookAt);
    
    
        action.Abort();
    
        action = new ECAAction(this, stages);
        action.CompletedAction += OnEndPaintVisit;
    
        action.StartAction();
    }


    public override void DetachEvent(string handlerName, EventArgs args)
    {
        if (handlerName == "SittableBusy")
            paintings[idxPaint].chair.SittableBusy -= OnChairBusy;
        if(handlerName == "SittableFree")
            paintings[idxPaint].chair.SittableFree -= OnChairFree;
    }


}