using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using UnityEngine;
using System.IO;
using System.Linq;

public class TTSServer : MonoBehaviour
{
	#region private members 	
	/// <summary> 	
	/// TCPListener to listen for incomming TCP connection 	
	/// requests. 	
	/// </summary> 	
	private TcpListener tcpListener;
	/// <summary> 
	/// Background thread for TcpServer workload. 	
	/// </summary> 	
	private Thread tcpListenerThread;
	/// <summary> 	
	/// Create handle to connected tcp client. 	
	/// </summary> 	
	private TcpClient connectedTcpClient;
	#endregion

	// Use this for initialization
	void Start()
	{
		// Start TcpServer background thread 		
		tcpListenerThread = new Thread(new ThreadStart(ListenForIncommingRequests));
		tcpListenerThread.IsBackground = true;
		tcpListenerThread.Start();
	}

	/// <summary> 	
	/// Runs in background TcpServerThread; Handles incomming TcpClient requests 	
	/// </summary> 	
	private void ListenForIncommingRequests()
	{
		try
		{
			// Create listener on localhost port 8052. 			
			tcpListener = new TcpListener(IPAddress.Parse("127.0.0.1"), 8052);
			tcpListener.Start();
            UnityEngine.Debug.Log("Server is listening");
			Byte[] bytes = new Byte[1024];
			while (true)
			{
				using (connectedTcpClient = tcpListener.AcceptTcpClient())
				{
					// Get a stream object for reading 					
					using (NetworkStream stream = connectedTcpClient.GetStream())
					{
						int length;
						// Read incomming stream into byte arrary. 						
						while ((length = stream.Read(bytes, 0, bytes.Length)) != 0)
						{
							var incommingData = new byte[length];
							Array.Copy(bytes, 0, incommingData, 0, length);
							// Convert byte array to string message. 							
							string clientMessage = Encoding.ASCII.GetString(incommingData);
							UnityEngine.Debug.Log("client message received as: " + clientMessage);

							//call function to generate audio
							GenerateRequestedAudio(clientMessage);
						}
					}
				}
			}
		}
		catch (SocketException socketException)
		{
            UnityEngine.Debug.Log("SocketException " + socketException.ToString());
		}
	}
	/// <summary> 	
	/// Send message to client using socket connection. 	
	/// </summary> 	
	private void SendMessage(string clientName)
	{
		if (connectedTcpClient == null)
		{
			return;
		}

		try
		{
			// Get a stream object for writing. 			
			NetworkStream stream = connectedTcpClient.GetStream();
			if (stream.CanWrite)
			{
				string serverMessage = "Audio generated for: " + clientName;
				// Convert string message to byte array.                 
				byte[] serverMessageAsByteArray = Encoding.ASCII.GetBytes(serverMessage);
				// Write byte array to socketConnection stream.               
				stream.Write(serverMessageAsByteArray, 0, serverMessageAsByteArray.Length);
                UnityEngine.Debug.Log("Server sent his message - should be received by client");
			}
		}
		catch (SocketException socketException)
		{
            UnityEngine.Debug.Log("Socket exception: " + socketException);
		}
	}

	private void GenerateRequestedAudio(string clientMessage)
    {
		string filename = "Assets\\Resources\\set_python.bat";
		
		//parse the string
		string[] requestArgs = clientMessage.Split('|');

		string line = "tts --text \"" + requestArgs[0] + "\" --model_name tts_models/en/ljspeech/tacotron2-DDC " +
						"--out_path Assets\\Resources\\Audio\\" + requestArgs[1] + ".wav";
		
		//replace string in file
		string[] fileLines = File.ReadAllLines(filename);

		using (StreamWriter writer = new StreamWriter(filename))
		{
			for (int currentLine = 0; currentLine < fileLines.Length; currentLine++)
			{
				if (currentLine == fileLines.Length-1)
					writer.WriteLine(line);
				else
					writer.WriteLine(fileLines[currentLine]);
			}
		}

		Process p = Process.Start("Assets\\Resources\\set_python.bat");
		p.WaitForExit();

		SendMessage(requestArgs[1]);

	}

    private void OnApplicationQuit()
    {
		tcpListener.Stop();
    }
}