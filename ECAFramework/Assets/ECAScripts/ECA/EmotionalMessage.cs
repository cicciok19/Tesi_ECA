/* File EmotionalMessage C# implementation of struct EmotionalMessage */



// global declaration start


using System;
using System.Collections.Generic;
using System.Globalization;

public struct MessageAction {
	public string actionType;
	public string firstParameter;
    public string secondParameter;
    public float probability;


    public static MessageAction zero = new MessageAction("","","");

	public MessageAction(string actionType,string firstParameter, string secondParameter, string probability = "1") {
		this.actionType = actionType;
		this.firstParameter = firstParameter;
        this.secondParameter = secondParameter;
        this.probability = (float) Convert.ToDouble(probability);
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

    public bool IsSit()
    {
        return actionType == "Sit";
    }
}

// global declaration end

public struct EmotionalMessage
{
// class declaration start
public static EmotionalMessage zero = new EmotionalMessage("",AvailableEmotions.None,"");
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
                messageActions = parsedMoreActions(parts);
            }
            else
                messageActions.Add(parsedSingleAction(action));

            return messageActions;

        }
    }

    private List<MessageAction> parsedMoreActions(string[] actions)
    {
        List<MessageAction> messageActions = new List<MessageAction>();
        bool actionTaken = false;

        foreach(string action in actions)
        {
            string[] parts = action.Split(new Char[] { '@' });


            if (parts.Length < 2)
                messageActions.Add(MessageAction.zero);
            else
            {
                MessageAction ma = new MessageAction();
                string[] probability;

                if (parts.Length == 2)
                {
                    probability = parts[1].Split(new Char[] { '#' });
                    parts[1] = probability[0];
                }
                else
                {
                    probability = parts[2].Split(new Char[] { '#' });
                    parts[2] = probability[0];
                }


                if (probability.Length == 2)
                {
                    if (actionTaken != false)
                    {
                        ma.probability = (float)Convert.ToDouble(probability[1]);
                        float random = UnityEngine.Random.Range(0f, 1f);

                        if (ma.probability > random)
                        {
                            actionTaken = true;
                            ma.actionType = parts[0];
                            ma.firstParameter = parts[1];
                            if (parts.Length == 3)
                                ma.secondParameter = parts[2];
                            else
                                ma.secondParameter = "";

                            messageActions.Add(ma);
                        }
                        else
                            messageActions.Add(MessageAction.zero);
                    }
                }
                else
                {
                    actionTaken = false;
                    ma.actionType = parts[0];
                    ma.firstParameter = parts[1];
                    if (parts.Length == 3)
                        ma.secondParameter = parts[2];
                    else
                        ma.secondParameter = "";

                    messageActions.Add(ma);
                }
            }

        }

        return messageActions;
    }

    public MessageAction parsedSingleAction(string singleAction)
    {
        string[] parts = singleAction.Split(new Char[] { '@' });

        if (parts.Length < 2)
            return MessageAction.zero;


        string[] probability;


        MessageAction ma = new MessageAction();

        if (parts.Length == 2)
        {
            probability = parts[1].Split(new Char[] { '#' });
            parts[1] = probability[0];
        }
        else
        {
            probability = parts[2].Split(new Char[] { '#' });
            parts[2] = probability[0];
        }

        if (probability.Length == 2)
        {
            ma.probability = float.Parse(probability[1], CultureInfo.InvariantCulture.NumberFormat);
            //ma.probability = (float)Convert.ToDouble(probability[1]);
            float random = UnityEngine.Random.Range(0f, 1f);

            if (ma.probability > random)
            {
                ma.actionType = parts[0];
                ma.firstParameter = parts[1];
                if (parts.Length == 3)
                    ma.secondParameter = parts[2];
                else
                    ma.secondParameter = "";

                return ma;
            }
            else
                return MessageAction.zero;
        }
        else
        {
            ma.actionType = parts[0];
            ma.firstParameter = parts[1];
            if (parts.Length == 3)
                ma.secondParameter = parts[2];
            else
                ma.secondParameter = "";

            return ma;
        }
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
