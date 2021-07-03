using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System;
using UnityEngine;

public class NeuralTTSModel : TTSModel
{
	private SpeechInfo currentInfo;

    public NeuralTTSModel()
    {
		ttsType = AvailableTTS.Tacotron_2;
    }


    public override void GenerateSpeechThread(SpeechInfo currentInfo)
    {
        base.GenerateSpeechThread();
		this.currentInfo = currentInfo;
		string filename = "Assets\\Resources\\set_python.bat";
		string text = currentInfo.TextToSpeech.Trim('"');
		string ecaName = currentInfo.EcaAnimator.Eca.Name;


		string line = "tts --text \"" + text + "\" --model_name tts_models/en/ljspeech/tacotron2-DDC " +
						"--out_path Assets\\Resources\\Audio\\" + ecaName + ".wav";

		//replace string in file
		string[] fileLines = File.ReadAllLines(filename);

		using (StreamWriter writer = new StreamWriter(filename))
		{
			for (int currentLine = 0; currentLine < fileLines.Length; currentLine++)
			{
				if (currentLine == fileLines.Length - 1)
					writer.WriteLine(line);
				else
					writer.WriteLine(fileLines[currentLine]);
			}
		}

		Process process = new Process();
		process.StartInfo.WindowStyle = ProcessWindowStyle.Minimized;
		process.StartInfo.FileName = "Assets\\Resources\\set_python.bat";
		process.EnableRaisingEvents = true;
		process.Start();
		process.WaitForExit();
		UnityMainThreadDispatcher.Instance().Enqueue(currentInfo.EcaAnimator.Play(currentInfo.EcaAnimator.Eca.Name, currentInfo.TextToSpeech));
	}

	private void OnExitProcess(object sender, EventArgs e)
    {
		
		UnityMainThreadDispatcher.Instance().Enqueue(currentInfo.EcaAnimator.Play(currentInfo.EcaAnimator.Eca.Name, currentInfo.TextToSpeech));
	}
}
