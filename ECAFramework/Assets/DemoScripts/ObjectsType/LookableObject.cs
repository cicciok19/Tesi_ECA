/* File LookableObject C# implementation of class LookableObject */



// global declaration start


using System;
using UnityEngine;
using UnityEngine.Assertions;


// global declaration end

public class LookableObject : MonoBehaviour
{

    protected GameObject lookPosition = null;
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
        GameObject gop = Instantiate(lookPosition); 
        gop.transform.parent = transform;
        gop.transform.localPosition = Vector3.zero;
        return gop.transform;
    }


    public Transform GetRandomLookPosition(float extent = 1.0f)
    {
        Vector3 randomShift = new Vector3(
            center.x + bounds.x * extent * (float)UnityEngine.Random.Range(-0.5f, 0.5f),
            center.y + bounds.y * extent * (float)UnityEngine.Random.Range(-0.5f, 0.5f),
            center.z + bounds.z * extent * (float)UnityEngine.Random.Range(-0.5f, 0.5f)
        );
    
        //lookPosition.transform.position = randomShift;
        GameObject gop = Instantiate(lookPosition);
        //gop.transform.parent = transform;
        gop.transform.localPosition = randomShift;
        return gop.transform;
    }


    public void OnAimCompleted(object sender, EventArgs args)
    {
        IKSetter ikManager = (IKSetter)sender;
        Transform target = ikManager.headIK.solver.target;

    }


    public static implicit operator Transform(LookableObject d)
    {
      return d.transform;
    }


}
