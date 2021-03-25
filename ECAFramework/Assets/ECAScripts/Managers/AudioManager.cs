/* File AudioManager C# implementation of class AudioManager */



// global declaration start


using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;




// global declaration end

public class AudioManager : MonoBehaviour
{

    private AudioSource utilityAudioSource;
    private AudioSource trafficAudioSource;

    public AudioClip TrafficSound;
    public AudioClip GoodActionSound;
    public AudioClip ErrorSound;


    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            //Destroy(this.gameObject);
            #if UNITY_EDITOR
                Utility.LogError("ERROR!!!! you can not use more than one AudioManager");
                UnityEditor.EditorApplication.isPlaying = false;
            #else
                Application.Quit();
            #endif
        }
        else
        {
            Instance = this;
            DontDestroyOnLoad(this.gameObject);
        }
    }


    private void OnGameStarted(object sender, EventArgs e)
    {
        trafficAudioSource.clip = TrafficSound;
        trafficAudioSource.Play();
    }




    protected void Start()
    {
        utilityAudioSource = gameObject.AddComponent<AudioSource>();
        trafficAudioSource = gameObject.AddComponent<AudioSource>();
        trafficAudioSource.volume = 0.5f;
        trafficAudioSource.loop = true;
    
        //IntentManager.Instance.UserCanNotSpeak += OnError;
    
        GameManager gameManager = GameObject.FindObjectOfType<GameManager>();
    
        if(gameManager != null)
        	gameManager.OnGameStarted += OnGameStarted;
    }




    public void OnError()
    {
        utilityAudioSource.clip = ErrorSound;
        utilityAudioSource.Play();
    }


    public void GoodEvent()
    {
        utilityAudioSource.clip = GoodActionSound;
        utilityAudioSource.Play();
    }


    public static AudioManager Instance
    { get; private set; }


}
