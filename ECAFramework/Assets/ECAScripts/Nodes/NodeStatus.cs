using System;

public enum GameErrorType
{
	Fine,
	Info,
	Warning,
	Error
};


public class NodeStatus
{


    public GameErrorType ErrorType
    {
      set; get;
    }


    public string ErrorString
    {
      set; get;
    }


    public GameNodeCompletionType CompletionStatus
    {
      set; get;
    }


}
