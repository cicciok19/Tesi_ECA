/* File LandingArea C# implementation of class LandingArea */



// global declaration start


using System;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Assertions;


// global declaration end

public class LandingArea : MonoBehaviour
{

    protected Vector3 bounds;
    protected Vector3 center;


    protected void Awake()
    {
      // computing object bounds
    
      Renderer renderer = GetComponent<Renderer>();
      Assert.IsNotNull(renderer);
    
      bounds = renderer.bounds.size;
      center = renderer.bounds.center;
    }




    public Vector3 GetRandomPosition(float extent = 1.0f)
    {
        NavMeshHit hit;  
        bool found = false;
    
        for(int i = 0; i < 10 ; i++)
        {
    	
      	    Vector3 position = new Vector3(
    		    center.x + bounds.x * extent * (float)UnityEngine.Random.Range(-0.5f, 0.5f),
    		    center.y,
    		    center.z + bounds.z * extent * (float)UnityEngine.Random.Range(-0.5f, 0.5f)
      	    );
    
    	    found = NavMesh.SamplePosition(position, out hit, 2f, NavMesh.AllAreas);
    
    
            if (found)
            {
                Debug.DrawRay(position, Vector3.up, Color.green, 15f);
                return hit.position;
            }
            	
        }
    
        Utility.LogError("Cannot find a position in " + name);
        return Vector3.zero;
    }


}
