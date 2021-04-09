
using System.Text;


class ParallelAndNode : AggregateNode
{
    protected int completedNodes;

    public ParallelAndNode(int id, string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode)
    :
    	base(id, readableName, instructions, childrenNodes, isTrainingMode)
    {
      completedNodes = 0;
    }

    public override void UpdateNode()
    {
      if(IsRunning)
      {
    	//execute current step on all children
        //checks all the children's status
    	for(int i = 0; i < childrenNodes.Length; i++)
    	{
    		GameGraphNode currentNode = childrenNodes[i];
    
    		//ignore already terminated children
    		if(!currentNode.IsRunning)
    			continue;
    
    		currentNode.UpdateNode();
    
    		//if it has finished (with errors or not)
    		if(!currentNode.IsRunning)
    	 	{
    			//increment completed counter
    			completedNodes++;
    
    			//if went ok and there's no reamining task, set current status as completed
    			if(currentNode.CurrentStatus.ErrorType == GameErrorType.Fine)
    			{
    				Utility.Log(string.Format("State {0}:{1} finished current node {2}:{3}", ID, ReadableName, currentNode.ID, currentNode.ReadableName));
    	
    				if(completedNodes >= childrenNodes.Length)
    				{
    					CurrentStatus.CompletionStatus = GameNodeCompletionType.Completed; 				
    
    					Utility.Log(string.Format("State {0}:{1} terminated with success", ID, ReadableName));
    				}
    			}
    			//else, set the error... we'll let the upper manager to decide how to handle the error.
    			else
    			{			
    				Utility.Log(string.Format("State {0}:{1} finished WITH ERRORS current node {2}:{3}", ID, ReadableName, currentNode.ID, currentNode.ReadableName));
    
    				CurrentStatus.CompletionStatus = GameNodeCompletionType.Completed; //if one task returns error, it is impossible to complete the AND
    				CurrentStatus.ErrorType = currentNode.CurrentStatus.ErrorType;
    				CurrentStatus.ErrorString = currentNode.CurrentStatus.ErrorString;
    			}
    		}		
    		
    	  }
      }
    }
    /// <summary>
    /// Fa la start di tutti i nodi figli
    /// </summary>
    /// <param name="speak"></param>
    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
        foreach (var child in childrenNodes)
            child.StartNode();
    }

    public override string ReadableDescription
    {
      get
      {
    	//concatenate all readable descriptions and write a AND between them
    	if(childrenNodes.Length == 0)
    		return string.Empty;
    
    	StringBuilder sb = new StringBuilder();
    
    	sb.Append(childrenNodes[0].ReadableDescription);
    
    	for(int i = 0; i < childrenNodes.Length; i++)
    	{
    		sb.Append("\n\n - AND - \n\n" + childrenNodes[i].ReadableDescription);
    	}
    
    	return sb.ToString();
      }
    }


}
