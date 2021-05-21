using System;
using System.Linq;
using System.Collections.Generic;
using IntentRecognitionResults;
using UnityEngine;
using UnityEngine.Assertions;

public class ManageLandingArea : ECAAction
{
    protected List<LandingAreaCircular> landingAreas = new List<LandingAreaCircular>();
    protected LandingAreaCircular landing;

    public ManageLandingArea(ECA eca) : base(eca)
    {
    }

    public override void OnCompletedAction()
    {
        base.OnCompletedAction();
    }

    protected void Landing()
    {
        landingAreas = GameObject.FindObjectsOfType<LandingAreaCircular>().ToList();
        if (landing == null)
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
        GoToStage goToStage = new GoToStage(landingArea.GetRandomPosition());
        AllStages = new ECAActionStage[1];
        AllStages[0] = goToStage;
        goToStage.Animator = eca.ecaAnimator;
    }

    public override void StartAction()
    {
        Landing();
        base.StartAction();
    }

    protected override void NextStage()
    {
        base.NextStage();
    }
}
