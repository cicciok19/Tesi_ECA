using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Initializer : MonoBehaviour
{
    [SerializeField] private string listOfMessagesFilename;

    private void Awake()
    {
        //Init configuration (scenario type, language, smartAction messages, xml files name ecc)
        Configuration.Instance.Init(listOfMessagesFilename);

        //Set the scenario (SmartActions, Nodes)
        /*if (Configuration.Instance.ActualScenario.Equals(ScenarioType.Training))
            FindObjectOfType<DemoScenario>().Init();*/

        //Init all ecas
        ECA[] allEca = FindObjectsOfType<ECA>();
        for (int i = 0; i < allEca.Length; i++)
            allEca[i].Init();

        //Init TTSServer (if not already loaded
        if (GetComponent<TTSServer>() == null)
            gameObject.AddComponent<TTSServer>();

        //Init logger
        // CSVManager.Instance.Init();

    }
}
