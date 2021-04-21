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
    protected IKECA ikManager;

    private int idxPaint;
    // class declaration end


    protected List<Painting> paintings = new List<Painting>();


    private void OnEndPaintVisit(object sender, EventArgs e)
    {
        Utility.Log("Visitor " + this.Name + " visited paint " + paintings[idxPaint].id);

        //free the paint
        paintings[idxPaint].Occupied = false;

        idxPaint++;

        if (paintings.Count > idxPaint)
        {
            while (paintings[idxPaint].Occupied)
            { 
                //while next paint is occupied do nothing
            }
            
            //then visit paint
            GoToPainting(paintings[idxPaint]);
        }
        else
        {
            Utility.Log("END OF APPLICATION");
            Application.Quit();
        }
    }




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

    public override void Init()
    {
        base.Init();

        CreateIKManager();
    }


    protected override void CreateAnimator()
    {
        ecaAnimator = GetComponent<ECAAnimatorMxM>();
        if (ecaAnimator == null)
            ecaAnimator = gameObject.AddComponent<ECAAnimatorMxM>();
        Assert.IsNotNull(ecaAnimator);
    }

    protected override void CreateIKManager()
    {
        ikManager = GetComponent<IKECA>();
        if (ikManager == null)
            ikManager = gameObject.AddComponent<IKECA>();
        Assert.IsNotNull(ikManager);
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

    public override void SetEcaId()
    {
        ID = Ecas.Default;
    }


    public void GoToPainting(Painting painting)
    {
        //set the status of the paint to occupied, only one visitor at time
        painting.Occupied = true;

        List<ECAActionStage> stages = new List<ECAActionStage>();
        GoToStage reachPainting = new GoToStage(painting.GetChairDestination());
        TurnStage turn = new TurnStage(painting.GetChairSitPoint(), true);
        SitStageWithIK sit = new SitStageWithIK(painting.GetChairEmpties(), ikManager);
        LookAtStage lookAt = new LookAtStage(painting.GetLookableObject(), ikManager);
        StandUpStage standUp = new StandUpStage(painting.GetChairSitPoint(), ikManager);
        stages.Add(reachPainting);
        stages.Add(turn);
        stages.Add(sit);
        stages.Add(lookAt);
        stages.Add(standUp);

        ECAAction newAction = new ECAAction(this, stages);
    
    
        newAction.CompletedAction += OnEndPaintVisit;
        Utility.Log("Visitor " + this.Name + " moving to " + painting.name);
    
        newAction.StartAction();
    }


}
