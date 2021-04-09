using System;

public class SmartActionCustomArgs : EventArgs {
    public SmartAction SmartAction;
    public Action FunctionToExecute;
    public string MessageType;
    public bool AnyTime;

    public SmartActionCustomArgs(SmartAction smartAction, Action functionToExecute, string messageType, bool anyTime = true)
    {
        SmartAction = smartAction;
        FunctionToExecute = functionToExecute;
        MessageType = messageType;
        AnyTime = anyTime;
    }
}


public class SmartActionNode : GameGraphNode
{
    public event EventHandler<SmartActionCustomArgs> OnAskingExecutionAfterMessage;

    public SmartActionNode(int id, string readableName, bool isTrainingMode) : base(id, readableName, isTrainingMode)
    {
    }
    protected virtual void AskExecutionAfterMessage(SmartActionCustomArgs args)
    {
        if (OnAskingExecutionAfterMessage != null)
            OnAskingExecutionAfterMessage(this, args);

        //ECAAnimationManager.NextECAAction();
    }

    public virtual SmartAction CurrentSmartAction { get; protected set; }
}
