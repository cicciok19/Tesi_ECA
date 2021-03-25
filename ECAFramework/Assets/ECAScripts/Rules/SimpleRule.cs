using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.Linq;


class Constraint : IComparable {

	public enum Type {None, Warning, Error};
	public string activityName;
	public Type level;
	protected int id;
	public string msg;

	public Constraint(string activityName,Type level,int id,string msg = "") {
		this.activityName = activityName;
		this.level = level;
		this.id = id;
		this.msg = msg;
	}

	public int CompareTo(object obj) {
		if(!(obj is Constraint))
			return 0;

		Constraint other = (Constraint)obj;
		if(level == other.level)
		{
			return level.CompareTo(other.level);
		}

		if(level > other.level)
			return -1;

		return 1;
	}
}

class SimpleRule
{
    public enum CheckResult {
	    DontCare,
	    OK,
	    Warning,
	    Error
    };

    protected List<Constraint> constraints = new List<Constraint>();

    public SimpleRule(string activity)
    {
        this.Activity = activity;

        Started = false;
        Completed = false;
        CheckedOnTrigger = false;
        TimeLimit = -1;
        WarningIssued = false;
    }

    public void AddConstraint(Constraint c)
    {
        constraints.Add(c);
    }
    public void AddConstraint(string activityName, Constraint.Type level, int id, string msg = "")
    {
        constraints.Add(new Constraint(activityName, level, id, msg));
    }

    //getter and setter
    public List<Constraint> GetConstraints()
    {
        return constraints;
    }
    public string Activity
    {
        protected set; get;
    }
    public bool Started
    {
        set; get;
    }
    public bool Completed
    {
        set; get;
    }
    public bool CheckedOnTrigger
    {
        set; get;
    }
    public int TimeLimit
    {
        set; get;
    }
    public bool WarningIssued
    {
        set; get;
    }
    
}
