/* File Configuration C# implementation of class Configuration */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;



	public enum ScenarioType
{
    Training,
    Rehearsal,
    Examination
}

	public enum SmartActions
{
    firstPaintProximityAction,
    secondPaintProximityAction,
    thirdPaintProximityAction,

    firstPaintInteraction,
    secondPaintInteraction,
    thirdPaintInteraction
}
    public enum EventDefinitions
{
    SitDown,
    StandUp,
    PickUp,
    PickDown
}
/// <summary>
/// Class used to define the name of the xml files that contain the necessary configurations
/// </summary>


public class XmlDocumentNames
{
    public XmlDocumentNames(string listOfMessages, string nluAndTtsConfiguration, string ecaList, string activeMessagesPerScenario = "")
    {
        ListOfMessages = listOfMessages;
        NluAndTtsConfiguration = nluAndTtsConfiguration;
        EcaList = ecaList;
        ActiveMessagesPerScenario = activeMessagesPerScenario;
    }

    public string ListOfMessages { get; set; }
    public string NluAndTtsConfiguration { get; set; }
    public string EcaList { get; set; }
    public string ActiveMessagesPerScenario { get; set; }   
}

/// <summary>
/// Fill provided methods with your parameters.
/// </summary>



// global declaration end

public class Configuration
{

    private static Configuration instance = null;


    public void Init()
    {
        SetLanguage();
        InitDocumentsNames();
        if (XmlDocumentNames == null)
        {
            Utility.LogError("You must define XML document names in order to init all configuration");
            return;
        }
        SetScenario();
        InitNluAndTts(XmlDocumentNames.NluAndTtsConfiguration);
        InitMessages(XmlDocumentNames.ListOfMessages, XmlDocumentNames.ActiveMessagesPerScenario);
    }


    private void SetLanguage()
    {
        XmlParser.InfoPath = "Ita";
    }


    private void InitDocumentsNames()
    {
        XmlDocumentNames = new XmlDocumentNames("ListOfMessages.xml", "Configuration.xml", "ECAs.xml", "ActiveMessagesPerScenario.xml");
    }


    private void SetScenario()
    {
        ActualScenario = ScenarioType.Training;
    }


    private void InitNluAndTts(string configuration)
    {
        XmlParser.InitAzureConfiguration(configuration);
    }


    private void InitMessages(string listOfMessages, string activeMessagesPerScenario)
    {
        //retreive info from XML files
        ECAParameters.SmartActionMessages = XmlParser.GetSmartActionMessages(listOfMessages);
        if (activeMessagesPerScenario != "")
            ECAParameters.ActiveMessagesPerScenario = XmlParser.GetActiveMessagesPerScenario(activeMessagesPerScenario);
    }

    /*
    protected void Awake()
    {
        Assert.IsNull(Instance);
        Instance = this;
        //Init();
    }
    */

    public ScenarioType ActualScenario
    { get; set; }

    /*
    public static Configuration Instance
    {
        get
        {
            return instance;
        }

        private set
        {
            instance = value;
        }
    }
    */

    public static Configuration Instance
    {
        get
        {
            if (instance == null)
                instance = new Configuration();
            return instance;
        }
    }

    public XmlDocumentNames XmlDocumentNames
    { get; protected set; }


}
