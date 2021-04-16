using UnityEngine;
using UnityEngine.Assertions;
using System;
using System.Collections.Generic;


	public enum GameNodeCompletionType
{
	Inactive,
	Running,
	Completed,
	Aborted
}




public abstract class GameGraphNode
{
    public static int IndexNode = 0;

    public event EventHandler<EventArgs> SpeakTimeout;
    public event EventHandler<EventArgs> OnStarted;
    public event EventHandler<EventArgs> OnCompleted;
    public event EventHandler<EventArgs> OnTriggered;

    private NodeStatus currentStatus;

    protected bool pause =  false;
    protected DateTime startTime;
    protected DateTime stopTime;
    protected DateTime triggeredTime;


    public GameGraphNode(string readableName, bool isTrainingMode)
    {
        IndexNode++;
        ID = IndexNode;
        ReadableName = readableName;
        IsTrainingMode = isTrainingMode;  
    
        //init current status
        CurrentStatus = new NodeStatus() { CompletionStatus = GameNodeCompletionType.Inactive, ErrorType = GameErrorType.Fine, ErrorString = string.Empty };
    
        Utility.Log(string.Format("State {0}:{1} created", IndexNode, ReadableName));
        Awake();   
    }

    protected virtual void Awake()
    {
      //showDialogWindow = true;
      HasTriggered = false;
    }
    protected virtual void NodeDescriptionCompleted(object sender, EventArgs args)
    {
      //Utility.Log("");
      //BLSLogger.CRSpeaker.SpeakTimeout -= NodeDescriptionCompleted;
      //BLSLogger.CRSpeaker.ClipTimeout -= NodeDescriptionCompleted;
    }
    protected virtual void TriggerNode()
    {
      //BLSLogger.Log(this,"activity triggered", BLSLogType.NodeTriggered);
      triggeredTime = DateTime.Now;
      HasTriggered = true;
      if(OnTriggered != null)
    	OnTriggered(this, EventArgs.Empty);
    }
    protected void BaseStartActions()
    {
        //Utility.Log("");
        CurrentStatus.CompletionStatus = GameNodeCompletionType.Running;    
        
        if(OnStarted != null)
            OnStarted(this, EventArgs.Empty);
    
        if(ManageToolTips())
            EnableToolTip(true);
    
        startTime = DateTime.Now;
        ScheduledTime = DateTime.Now;
    }
    protected virtual void EnableToolTip(bool enable)
    {
    }
    protected virtual void ResetNode()
    {
      // that's for loopable nodes, to bring them to a clean state before a new start
      //init current status
      CurrentStatus = new NodeStatus() { 
    	CompletionStatus = GameNodeCompletionType.Inactive, 
    	ErrorType = GameErrorType.Fine, 
    	ErrorString = string.Empty };
    }
    public virtual void UpdateNode()
    {
    }
    public virtual void FixedUpdateNode()
    {
    }
    public virtual void DisposeNode()
    {
    }
    public virtual void SetCompleted()
    {
        Utility.Log("activity completed correctly " + this.GetType());
    
        CurrentStatus = new NodeStatus() { 
    	CompletionStatus = GameNodeCompletionType.Completed, 
    	ErrorType = GameErrorType.Fine, 
    	ErrorString = string.Empty 
        };
    
        if(OnCompleted != null)
    	    OnCompleted(this, EventArgs.Empty);
    
        if(ManageToolTips())
      	    EnableToolTip(false);
    
        stopTime = DateTime.Now;
    }
    public void OnCompleteRequest(object sender,EventArgs args)
    {
      Utility.Log("received request to complete node " + this + " from " + sender);
      SetCompleted();
    }
    public virtual void StartNode(bool speak = true)
    {
      BaseStartActions();    
      //if(IsTrainingMode && showDialogWindow)
      	//RaiseWidget();
    }
    public virtual void PauseNode()
    {
      //BLSLogger.Log(this,"node paused");
      pause = true;
    }
    public virtual void RestartNode()
    {
      //BLSLogger.Log(this,"node restarted");
      pause = false;
    }
    public virtual void AbortNode()
    {
      if(IsAborted)
    	return;
    
      stopTime = DateTime.Now;
      currentStatus.CompletionStatus = GameNodeCompletionType.Aborted;
    
    /*
        if(OnAborted != null)
    	OnAborted(this, EventArgs.Empty);
    */
    
        if(ManageToolTips())
      	    EnableToolTip(false);
    }
    public static bool ManageToolTips()
    {
      //Assert.IsTrue(false);
      return false;
      //return GameManager.Session == SessionType.Learning;
    }
    public int ID
    {
          set; get;
        }
    public bool IsAborted
    {
          get
          {
        	return currentStatus.CompletionStatus == GameNodeCompletionType.Aborted;
          }
        }
    public bool IsPaused
    {
          get {
        	return pause;
          }
        }
    public bool IsRunning
    {
          get
          {
        	return CurrentStatus.CompletionStatus == GameNodeCompletionType.Running;
          }
        }
    public bool IsCompleted
    {
          get
          {
        	return CurrentStatus.CompletionStatus == GameNodeCompletionType.Completed;
          }
        }
    public bool HasTriggered
    {
          get;
          protected set;
        }
    public bool IsChildNode
    {
          set; get;
        }
    public virtual string ReadableDescription
    {
          get
          {
        	return "";
          }
        
          set {}
        }
    public string ReadableName
    {
          protected set; get;
        }

    public bool IsScheduled
    {
        set; get;
    } = false;
    public bool FinishedInTime
    {
        set; get;
    } = false;
    public int TimeSpent()
    {
        if (!IsCompleted)
            return -1;

        TimeSpan ts;
        if (IsScheduled)
            ts = stopTime - ScheduledTime;
        else
            ts = stopTime - startTime;

        return (int)ts.TotalSeconds;
    }

    public DateTime ScheduledTime
    {
          set; get;
        }
    public DateTime StopTime
    {
          get {
        	return stopTime;
          }
        }
    public DateTime StartTime
    {
          get {
        	return startTime;
          }
        }
    public DateTime TriggeredTime
    {
          get {
        	return triggeredTime;
          }
        }
    public string Label
    {
          set; get;
        }
    public NodeStatus CurrentStatus
    {
          set
          {
        	currentStatus = value;
          }
          get
          {
        	return currentStatus;
          }
        }
    public bool showDialogWindow
    {
          set; get;
        }
    public bool IsTrainingMode
    {
          set; get;
        }
}
