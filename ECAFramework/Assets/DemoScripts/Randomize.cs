using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.Assertions;

public class Randomize : MonoBehaviour
{

    public static Vector3 GetRandomPosition(LandingArea landingArea, float extent = 1.0f)
    {
        Renderer renderer = landingArea.GetComponent<Renderer>();
        Assert.IsNotNull(renderer);

        var bounds = renderer.bounds.size;
        var center = renderer.bounds.center;

        NavMeshHit hit;
        bool found = false;

        for (int i = 0; i < 10; i++)
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

        Utility.LogError("Cannot find a position in " + landingArea.name);
        return Vector3.zero;
    }

    public static Transform GetRandomPosition(GameObject gameObject, float extent = 1.0f, int x = 1, int y = 1, int z = 1)
    {
        Renderer renderer = gameObject.GetComponent<Renderer>();
        Assert.IsNotNull(renderer);

        var bounds = renderer.bounds.size;
        var center = renderer.bounds.center;


        Vector3 randomShift = new Vector3(
            center.x + bounds.x * extent * (float)UnityEngine.Random.Range(-0.5f, 0.5f) * x,
            center.y + bounds.y * extent * (float)UnityEngine.Random.Range(-0.5f, 0.5f) * y,
            center.z + bounds.z * extent * (float)UnityEngine.Random.Range(-0.5f, 0.5f) * z
        );


        GameObject gop = Instantiate(gameObject);
        gop.transform.localScale = Vector3.zero;
        gop.transform.localPosition = randomShift;
        return gop.transform;
    }

    public static Vector3 GetRandomPositionRound(GameObject gameObject, float minDistance, float maxDistance)
    {
        Renderer renderer = gameObject.GetComponent<Renderer>();
        Assert.IsNotNull(renderer);

        Vector3 center = renderer.bounds.center;
        Vector2 position;

        if(minDistance == 0)
            position = Random.insideUnitCircle * maxDistance;
        else
        {
            float wallRadius = (maxDistance - minDistance) * .5f;
            float ringRadius = wallRadius + minDistance;
            float rndAngle = Random.value * 6.28f;

            float cX = Mathf.Sin(rndAngle);
            float cZ = Mathf.Cos(rndAngle);

            Vector2 ringPos = new Vector2(cX, cZ);
            ringPos *= ringRadius;

            Vector2 sPos = Random.insideUnitCircle * wallRadius;

            position = ringPos + sPos;
        }

        Vector3 randomShift = new Vector3(
            center.x + position.x,
            center.y,
            center.z + position.y
            );

        Debug.DrawRay(randomShift, Vector3.up, Color.green, 15f);

        return randomShift;
    }

}
