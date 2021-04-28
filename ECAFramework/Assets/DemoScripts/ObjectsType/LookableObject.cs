/* File LookableObject C# implementation of class LookableObject */

/*      CG&VG group @ Politecnico di Torino               */
/*              All Rights Reserved	                      */
/*                                                        */
/*  THIS IS UNPUBLISHED PROPRIETARY SOURCE CODE OF CG&VG  */
/*  The copyright notice above does not evidence any      */
/*  actual or intended publication of such source code.   */


// global declaration start


using UnityEngine;
using UnityEngine.Assertions;


// global declaration end

public class LookableObject : MonoBehaviour
{
// class declaration start
public static implicit operator Transform(LookableObject d) => d.transform;
// class declaration end


    protected GameObject lookPosition =   null;
    protected Vector3 bounds;
    protected Vector3 center;


    private void Start()
    {
      // creating look position
    
      lookPosition = new GameObject(name + "_LookPosition");
      lookPosition.transform.parent = transform;
    
      lookPosition.transform.position = Vector3.zero;
      lookPosition.transform.rotation = Quaternion.identity;
      lookPosition.transform.localScale = Vector3.one;
    
      // computing object bounds
    
      Renderer renderer = GetComponent<Renderer>();
      Assert.IsNotNull(renderer);
    
      bounds = renderer.bounds.size;
      center = renderer.bounds.center;
    
      lookPosition.transform.position = center;
    }




    public Transform GetLookPosition()
    {
      return lookPosition.transform;
    }


    public Transform GetRandomLookPosition(float extent = 1.0f)
    {
      System.Random random = new System.Random();
    
      Vector3 randomShift = new Vector3(
    	center.x + bounds.x * extent * (float)random.NextDouble(),
    	center.y + bounds.y * extent * (float)random.NextDouble(),
    	center.z + bounds.z * extent * (float)random.NextDouble()
      );
    
      lookPosition.transform.position = randomShift; 
    
      return lookPosition.transform;
    }


}
