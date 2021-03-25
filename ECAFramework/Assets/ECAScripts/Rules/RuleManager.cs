using UnityEngine;
using UnityEngine.Assertions;
using System.Collections;
using System.Collections.Generic;
using System;
using System.Linq;
using System.Xml;


class RuleCheckingArgs : EventArgs {

	public enum Type {Ok, Warning, Error};

	public string activityName;
	public GameGraphNode node;
	public RuleCheckingArgs.Type level;
	public string causedBy;
	public string msg;

	public RuleCheckingArgs(string activityName, GameGraphNode node, RuleCheckingArgs.Type level, string causedBy = "", string msg = "") {
		this.activityName = activityName;
		this.node = node;
		this.level = level;
		this.causedBy = causedBy;
		this.msg = msg;
	}
}


class RuleManager
{

    public event EventHandler<RuleCheckingArgs> OnSuccesfullActivity;
    public event EventHandler<RuleCheckingArgs> OnWarning;
    public event EventHandler<RuleCheckingArgs> OnError;

    protected Dictionary<string, SimpleRule> rules = new Dictionary<string, SimpleRule>();
    protected string rulesPath = "";


    public RuleManager()
    {
      //this.Session = session;
      ReadXMLRules();
    }
    public RuleManager(string rulesPath)
    {
      //this.Session = session;
      this.rulesPath = rulesPath;
      ReadXMLRules();
    }

    protected void ReadXMLRules()
    {
      string xmlFile = "EvaluationRules.xml";    
  
      XmlDocument doc = new XmlDocument();
      xmlFile = xmlFile.Replace(System.IO.Path.GetExtension(xmlFile),"");
    
      if(rulesPath != "")
    	xmlFile = rulesPath + "/" + xmlFile;
    
      TextAsset xmlAsset = (TextAsset) Resources.Load(xmlFile);
      try {
    	doc.LoadXml(xmlAsset.text);
      }
      catch(Exception e)
      {
    	Utility.LogError("error in loading file " + xmlFile + " :: " + e);
    	return;
      }
      
      //Debug.Log("Loading " + xmlFile);
      ParseXML(doc);
    }
    protected void ParseXML(XmlDocument doc)
    {
        XmlNodeList nodeList = doc.SelectNodes("/nodes/node");
        int ruleId = 0;

        foreach (XmlNode node in nodeList)
        {
            if (node.Attributes["name"] != null)
            {
                string activityName = node.Attributes["name"].InnerText;
                SimpleRule rule = new SimpleRule(activityName);

                Utility.Log("constraints for " + activityName);

                XmlNodeList constraintList = node.SelectNodes("constraint");

                foreach (XmlNode constraint in constraintList)
                {
                    Assert.IsNotNull(constraint.Attributes["action"]);
                    Assert.IsNotNull(constraint.Attributes["level"]);

                    string actionName = constraint.Attributes["action"].InnerText;
                    Constraint.Type type;

                    if (constraint.Attributes["level"].InnerText == "error")
                        type = Constraint.Type.Error;
                    else
                    if (constraint.Attributes["level"].InnerText == "warning")
                        type = Constraint.Type.Warning;
                    else
                    {
                        Utility.LogError("unrecognized constraint level type " + constraint.Attributes["level"].InnerText);
                        type = Constraint.Type.None;
                    }

                    rule.AddConstraint(actionName, type, ruleId);
                    ruleId++;

                    Utility.Log("Added constraints for " + actionName + " level " + type);
                }

                rule.TimeLimit = Int32.Parse(node.Attributes.GetNamedItem("time").InnerText);
                AddRule(activityName, rule);
            }
        }
    }
    protected void AddRule(string action, SimpleRule rule)
    {
        if (rules.ContainsKey(action))
        {
            var oldRule = rules[action];

            if (oldRule != null)
                Utility.LogWarning("adding rule to action that already had a rule");

            rules[action] = rule;
        }

        rules.Add(action, rule);
    }
    protected bool CheckRuleOnCompletion(SimpleRule rule,GameGraphNode node)
    { 
      List<Constraint> constraints = rule.GetConstraints();
      bool satisfied = true;
    
      Constraint errorConstraint = null;
      Constraint warningConstraint = null;
    
      for(int i=0;i < constraints.Count; i++)
      {
    	SimpleRule previous = GetRule(constraints[i].activityName);
    
    	//Assert.IsNotNull(previous);
    	if(previous == null)
    	{
    		Utility.LogWarning("Rule manager: missing activity " + constraints[i].activityName + " in xml rules");
    		continue;
    	}
    
    	if(!previous.Completed)
    	{
    		satisfied = false;
    
    		if(constraints[i].level == Constraint.Type.Error)
    		{
    			Utility.LogError(rule.Activity + " unsatisfed constraint: activity " + previous.Activity + " not completed (ERROR)");
    			if(errorConstraint == null || constraints[i].CompareTo(errorConstraint) < 0)
    				errorConstraint = constraints[i];
    		}
    		else
    		if(constraints[i].level == Constraint.Type.Warning)
    		{
    			Utility.LogError(rule.Activity + " unsatisfed constraint: activity " + previous.Activity + " not completed (WARNING)");
    			if(warningConstraint == null || constraints[i].CompareTo(warningConstraint) < 0)
    				warningConstraint = constraints[i];
    		}
    		else
    			Utility.Log(rule.Activity + " unsatisfed constraint: activity " + previous.Activity + " not completed (NO SIGNAL)");
    	}
      }
    
      if(satisfied)
      {
    	if(OnSuccesfullActivity != null)
    		OnSuccesfullActivity(this, new RuleCheckingArgs(rule.Activity, node, RuleCheckingArgs.Type.Ok));
      }
      else
      {
    	if(errorConstraint != null && OnError != null)
    	{
    		OnError(this, new RuleCheckingArgs(rule.Activity, node, RuleCheckingArgs.Type.Error, errorConstraint.activityName, errorConstraint.msg));		
    	}
    	else
    	if(errorConstraint == null && warningConstraint != null && OnWarning != null)
    	{
    		OnWarning(this, new RuleCheckingArgs(rule.Activity, node, RuleCheckingArgs.Type.Warning, warningConstraint.activityName, warningConstraint.msg));		
    	}
      }
    
      return satisfied;
    }
    protected void CheckActivity(object sender,EventArgs args, bool fromCompletion)
    {
      GameGraphNode node = (GameGraphNode)sender;
      string activityName = node.GetType().ToString();
    
      SimpleRule rule = GetRule(activityName);
      if(rule == null)
      {
    	Utility.LogError("no rules defined for activity " + activityName);
    	return;
      }
    
      rule.Completed = fromCompletion;
    
      if(fromCompletion && rule.CheckedOnTrigger)
    	return;
    
      if(!fromCompletion)
    	rule.CheckedOnTrigger = true;
    
      CheckRuleOnCompletion(rule, node);
    }
    /*
    public SessionType Session
    {
      protected set; 
      get;
    }
    */
    public void CleanRule(string action)
    {
      SimpleRule rule = GetRule(action);
      if(rule != null)
      {
    	rule.Completed = false;
      }
    }
    public SimpleRule GetRule(string activityName)
    {
      if(rules.ContainsKey(activityName))
      	return rules[activityName];
    
      return null;
    }
    public void OnActivityTriggered(object sender,EventArgs args)
    {
      CheckActivity(sender, args, false);
    }
    public void OnActivityStarted(object sender,EventArgs args)
    {
      GameGraphNode node = (GameGraphNode)sender;
      string activityName = node.GetType().ToString();
    
      //Utility.Log(activityName + " started");
    
      SimpleRule rule = GetRule(activityName);
      if(rule == null)
      {
    	Utility.LogError("no rules defined for activity " + activityName);
    	return;
      }
    
      rule.Started = true;
    }
    public void OnActivityCompleted(object sender,EventArgs args)
    {
      CheckActivity(sender, args, true);
    }
    public void OnGameCompleted(object sender,EventArgs args)
    {
      // placeholder for possible activities (e.g. logging...)
    }
}
