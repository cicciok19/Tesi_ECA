using IntentRecognitionResults;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface IIntentHandler
{
    /**
     * the function that must be implemented by specific IntentHandler and menage the task rappresented by intent
    **/
    void Handle(Intent intent);
    List<string> IntentName { get; set; }
    void SubscribeHandlerToIntentManager();
    void HandleIntentNotRecognized();
}
