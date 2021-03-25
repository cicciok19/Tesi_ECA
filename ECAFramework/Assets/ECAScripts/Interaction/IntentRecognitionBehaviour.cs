using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class IntentRecognitionBehaviour : MonoBehaviour
{
    public Text RecognizedText;
    public Image MicrophoneIcon;
    private bool isRecognizing;

    private static IntentRecognitionBehaviour instance = null;
    public static IntentRecognitionBehaviour Instance { get; private set; }
    private void Awake()
    {
        if(MicrophoneIcon!=null)
            MicrophoneIcon.enabled = false;

        if (instance != null && instance != this)
        {
            Utility.LogError("You can not use multiple StartIntentRecognition script");
            Application.Quit();
            return;
        }
        else
            Instance = this;
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.R))
        {
            if (!TtsManager.IsSpeaking)
            {
                isRecognizing = true;
                if (MicrophoneIcon != null)
                    StartCoroutine(IconAnimation());
                ShowRecognizedText("...");
                IntentManager.Instance.StartSingleSentenceRecognition();
            }
            else
                AudioManager.Instance.OnError();
        }
    }

    public void ShowRecognizedText(string text)
    {
        if (RecognizedText != null)
            RecognizedText.text = text;
        else
            Utility.LogWarning("no recognizing Text GUI setted");
    }

    public void RecognizingStopped()
    {
        StartCoroutine(hideTextDelay());
    }

    private IEnumerator hideTextDelay()
    {
        yield return new WaitForSeconds(2);
        isRecognizing = false;
        RecognizedText.text = "";
    }

    private IEnumerator IconAnimation()
    {
        MicrophoneIcon.enabled = true;
        Vector3 scale = MicrophoneIcon.transform.localScale;
        while (isRecognizing)
        {
            float scaleValue = Mathf.Lerp(0.8f, 1.1f, Mathf.PingPong(Time.time*2.2f, scale.x));
            MicrophoneIcon.transform.localScale = new Vector3(scaleValue, scaleValue, scaleValue);
            MicrophoneIcon.color = Color.Lerp(Color.white, Color.green, Mathf.PingPong(Time.time * 2.2f, 1));
            yield return null;
        }
        //MicrophoneIcon.color = Color.white;
        MicrophoneIcon.transform.localScale = scale;
        MicrophoneIcon.enabled = false;
    }

}
