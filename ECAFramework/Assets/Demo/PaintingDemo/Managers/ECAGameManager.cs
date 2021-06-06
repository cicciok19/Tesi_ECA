using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
/// <summary>
/// Extends <see cref="GameManager"/> in order to manage smartActions. 
/// Keeps track all smartActions and all nodes
/// </summary>
public class ECAGameManager : GameManager
{
    public static Dictionary<SmartActions, SmartAction> AllSmartActions = new Dictionary<SmartActions, SmartAction>();
    public static Dictionary<int, GameGraphNode> AllSimpleNodes = new Dictionary<int, GameGraphNode>();

    protected override void Start()
    {
        //CSVManager.Instance.Init();
        ECAManager.Instance.AvailableEcas[Ecas.Sophie].SendMessage("StartGame", StartGame);
    }
    protected override void StartGame()
    {
        base.StartGame();
        ECAManager.Instance.SetStartTime();
    }
}
