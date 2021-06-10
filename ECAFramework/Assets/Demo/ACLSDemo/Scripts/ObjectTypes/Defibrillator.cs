using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class Defibrillator : MonoBehaviour
{
    private GrabbableObject leftPaddle;
    private GrabbableObject rightPaddle;
    private DefibrillatorScreen screen;
    private ECAButton button;

    private void Awake()
    {
        rightPaddle = GetComponentInChildren<PaddleRight>();
        leftPaddle = GetComponentInChildren<PaddleLeft>();
        screen = GetComponentInChildren<DefibrillatorScreen>();
        button = GetComponentInChildren<ECAButton>();
    }

    public GrabbableObject GetRightPaddle()
    {
        return rightPaddle;
    }

    public GrabbableObject GetLeftPaddle()
    {
        return leftPaddle;
    }

    public DefibrillatorScreen GetScreen()
    {
        return screen;
    }

    public ECAButton GetButton()
    {
        return button;
    }
}
