using System;

class SequentialNode : AggregateNode
{
    private int currentNodeIdx=-1;

    public SequentialNode(int id, string readableName, string instructions, GameGraphNode[] childrenNodes, bool isTrainingMode)
    :
    	base(id, readableName, instructions, childrenNodes, isTrainingMode)
    {
      
    }

    public override void UpdateNode()
    {
        if (IsRunning)
        {

            if (CurrentNode.IsRunning)
                CurrentNode.UpdateNode();
            else
            if (CurrentNode.CurrentStatus.CompletionStatus == GameNodeCompletionType.Completed &&
                CurrentNode.CurrentStatus.ErrorType == GameErrorType.Fine)
            {
                StartNextNode();
            }
            else
            {

                Utility.Log(string.Format("State {0}:{1} finished WITH ERRORS current node {2}:{3}", ID, ReadableName, CurrentNode.ID, CurrentNode.ReadableName));

                CurrentStatus.CompletionStatus = GameNodeCompletionType.Aborted; //if one task returns error, it is impossible to complete the AND
                CurrentStatus.ErrorType = CurrentNode.CurrentStatus.ErrorType;
                CurrentStatus.ErrorString = CurrentNode.CurrentStatus.ErrorString;

                return;
            }
        }

    }
    public override string ReadableDescription
    {
      get
      {
    	return CurrentNode.ReadableDescription;
      }
    }
    public GameGraphNode CurrentNode
    {
        get
        {
            if (currentNodeIdx >= 0 && currentNodeIdx < childrenNodes.Length)
                return childrenNodes[currentNodeIdx];

            return null;
        }
    }
    protected virtual void StartNextNode()
    {
        currentNodeIdx++;

        if (currentNodeIdx >= childrenNodes.Length)
        {
            SetCompleted();
            return;
        }

        CurrentNode.StartNode();
    }
    public override void StartNode(bool speak = true)
    {
        base.StartNode(speak);
        currentNodeIdx = 0;
        CurrentNode.OnCompleted += onChildrenCompleted;
        CurrentNode.StartNode();
        Utility.Log("starting node" + CurrentNode.GetType());
    }

    public virtual void onChildrenCompleted(object sender, EventArgs e)
    {
        StartNextNode();
    }
}
