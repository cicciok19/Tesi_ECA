// global declaration start


using UnityEngine.Assertions;

// global declaration end

abstract class AggregateNode : GameGraphNode
{

    protected GameGraphNode[] childrenNodes;


    public AggregateNode(int id, string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode)
    :base(id, readableName, isTrainingMode)
    {
      SetChildren(childrenNodes);
    }
    public AggregateNode(int id, string readableName, string instructions, bool isTrainingMode)
    :base(id, readableName, isTrainingMode)
    {
    }

    protected void SetChildren(GameGraphNode[] childrenNodes)
    {
       Assert.IsNotNull(childrenNodes);
    
       this.childrenNodes = childrenNodes; 
       for(int i=0;i<childrenNodes.Length;i++)
    	childrenNodes[i].IsChildNode = true;
    }
    public GameGraphNode[] GetChildren()
    {
      return childrenNodes;
    }
    public GameGraphNode GetChild<T>()
    {
      for(int i=0;i < childrenNodes.Length; i++)
      {
    	if(childrenNodes[i] is AggregateNode)
    	{
    		GameGraphNode found = ((AggregateNode)childrenNodes[i]).GetChild<T>();
    		if(found != null)
    			return found;
    	}
    	else
    	if(childrenNodes[i] is T)
    		return childrenNodes[i];
      }
    
      return null;
    }


}
