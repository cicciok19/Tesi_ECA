/* File EmotionalMessage C# implementation of struct EmotionalMessage */



// global declaration start


using System;
using System.Collections.Generic;

public struct MessageAction {
	public string actionType;
	public string firstParameter;
    public string secondParameter;

    public static MessageAction zero = new MessageAction("","","");

	public MessageAction(string actionType,string firstParameter, string secondParameter) {
		this.actionType = actionType;
		this.firstParameter = firstParameter;
        this.secondParameter = secondParameter;
     	}

	public bool IsLookAt() {
		return actionType == "LookAt";
	}

	public bool IsPointAt() {
		return actionType == "PointAt";
	}

	public bool IsMoveTo() {
		return actionType == "MoveTo";
	}

	public bool IsMakeGesture() {
		return actionType == "MakeGesture";
	}

    public bool IsPickUp()
    {
        return actionType == "PickUp";
    }
}

// global declaration end

public struct EmotionalMessage
{
// class declaration start
public static EmotionalMessage zero = new EmotionalMessage("@@@@@@###ppopopoggvhgkhgt6rù§§§§§",AvailableEmotions.None,"@@@@@@###ppopopoggvhgkhgt6rù§§§§§");
// class declaration end



    public EmotionalMessage(string message, AvailableEmotions emotion,string action)
    {
      this.message = message;
      this.emotion = emotion;
      this.action = action;
    }

    public string message
    {
      set; get;
    }

    public AvailableEmotions emotion
    {
      set; get;
    }

    public string action
    {
      set; get;
    }

    public List<MessageAction> parsedActions
    {
      get {
            /*
    	    string[] parts = action.Split(new Char[] {'@'});
    
    	    if(parts.Length < 2)
    		    return MessageAction.zero;
    
    	    MessageAction ma = new MessageAction();
    
    	    ma.actionType = parts[0];
    	    ma.parameter = parts[1];
    
    	    return ma;
            */
            List<MessageAction> messageActions = new List<MessageAction>();
            if (action.Contains(";"))
            {
                string[] parts = action.Split(new Char[] { ';' });
                for (int i = 0; i < parts.Length; i++)
                {
                    messageActions.Add(parsedSingleAction(parts[i]));
                }
            }
            else
                messageActions.Add(parsedSingleAction(action));

            return messageActions;

        }
    }

    public MessageAction parsedSingleAction(string singleAction)
    {
        string[] parts = singleAction.Split(new Char[] { '@' });

        if (parts.Length < 2)
            return MessageAction.zero;

        MessageAction ma = new MessageAction();

        ma.actionType = parts[0];
        ma.firstParameter = parts[1];
        if (parts.Length == 3)
            ma.secondParameter = parts[2];
        else
            ma.secondParameter = "";

        return ma;
    }

    public static bool operator !=(EmotionalMessage a,EmotionalMessage b)
    {
      if(a.message == b.message)
    	return false;
    
      if(a.action == b.action)
    	return false;
    
    
      return true;
    }

    public static bool operator ==(EmotionalMessage a,EmotionalMessage b)
    {
      if(a.message != b.message)
    	return false;
    
      if(a.action != b.action)
    	return false;
    
    
      return true;
    }

}
