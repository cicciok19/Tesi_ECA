using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using RootMotion.FinalIK;

public class IKManager : MonoBehaviour
{
    private AimIK[] AimIKs;

    private AimIK HeadIK;
    private AimIK ShoulderIK;

    private FullBodyBipedIK FullBody;

    private GameObject TargetHead;

    private bool CheckAngleHead;
    private bool ZeroValueHead;
    private bool CoroutineHead;
    private float AngleHead;
    private int nAngleZeroHead;
    private int nAngleOneHead;

    // Start is called before the first frame update
    void Start()
    {
        //AimIKs = new AimIK[2];
        AimIKs = GetComponents<AimIK>();

        HeadIK = AimIKs[1];
        ShoulderIK = AimIKs[0];

        TargetHead = GameObject.FindGameObjectWithTag("Player");
        HeadIK.solver.IKPosition = TargetHead.transform.position;

        FullBody = GetComponent<FullBodyBipedIK>();

        CheckAngleHead = true;
        ZeroValueHead = false;
        CoroutineHead = false;
    }

    // Update is called once per frame
    void Update()
    {
        //controllo angolo testa in modo che non faccia l'esorcista
        if (CheckAngleHead)
        {
            CheckAngleHead = false;
            AngleHead = Vector3.Angle(this.transform.forward, TargetHead.transform.position - this.transform.position);
            print(Mathf.Abs(AngleHead));
            if (Mathf.Abs(AngleHead) > 80 && !ZeroValueHead)
            {
                nAngleZeroHead += 1;
                if (nAngleZeroHead == 25)
                {
                    nAngleZeroHead = 0;
                    nAngleOneHead = 0;

                    if (!CoroutineHead)
                    {
                        CoroutineHead = true;
                        StartCoroutine(NotWatchTarget());
                    }

                    ZeroValueHead = true;
                }
            }
            else if (Mathf.Abs(AngleHead) < 80 && ZeroValueHead)
            {
                nAngleOneHead += 1;
                if (nAngleOneHead == 25)
                {
                    nAngleOneHead = 0;
                    nAngleZeroHead = 0;

                    if (!CoroutineHead)
                    {
                        CoroutineHead = true;
                        StartCoroutine(WatchTarget());
                    }

                    ZeroValueHead = false;
                }
            }
            CheckAngleHead = true;
        }
    }

    IEnumerator WatchTarget()
    {
        float var = HeadIK.solver.IKPositionWeight;

        while (var < 1f)
        {
            HeadIK.solver.SetIKPositionWeight(var);
            yield return new WaitForSeconds(.005f);
            var += .01f;
        }

        CoroutineHead = false;
    }

    IEnumerator NotWatchTarget()
    {
        float var = HeadIK.solver.IKPositionWeight;

        while (var > 0f)
        {
            HeadIK.solver.SetIKPositionWeight(var);
            yield return new WaitForSeconds(.005f);
            var -= .01f;
        }

        CoroutineHead = false;
    }

    public void SetTargetHead(GameObject t)
    {
        TargetHead = t;
        HeadIK.solver.IKPosition = TargetHead.transform.position;
    }

    public void SetChairEffectors(Transform hips, Transform l_foot, Transform r_foot)
    {
        FullBody.solver.bodyEffector.position = hips.position;
        FullBody.solver.leftFootEffector.position = l_foot.position;
        FullBody.solver.rightFootEffector.position = r_foot.position;
    }
    /// <summary>
    /// Setta il peso degli effector per la seduta. Se OnOff=true alza il peso, al contrario lo abbassa
    /// </summary>
    /// <param name="OnOff"></param>
    public void SetChairWeight(bool OnOff)
    {
        if (OnOff)
        {
            StartCoroutine(HipsEffectorOn());
            StartCoroutine(FeetEffectorOn());
        }
        else
        {
            StartCoroutine(HipsEffectorOff());
            StartCoroutine(FeetEffectorOff());
        }
    }

    IEnumerator HipsEffectorOn()
    {
        float var = FullBody.solver.bodyEffector.positionWeight;

        while (var < 1)
        {
            var += .01f;
            FullBody.solver.bodyEffector.positionWeight = var;
            yield return new WaitForSeconds(.02f);
        }
    }

    IEnumerator HipsEffectorOff()
    {
        float var = FullBody.solver.bodyEffector.positionWeight;

        while (var > 0)
        {
            var -= .01f;
            FullBody.solver.bodyEffector.positionWeight = var;
            yield return new WaitForSeconds(.01f);
        }
    }

    IEnumerator FeetEffectorOn()
    {
        float varL = FullBody.solver.leftFootEffector.positionWeight;
        float varR = FullBody.solver.rightFootEffector.positionWeight;

        while (varL < 1 || varR < 1)
        {
            varL += .01f;
            varR += .01f;
            FullBody.solver.leftFootEffector.positionWeight = varL;
            FullBody.solver.rightFootEffector.positionWeight = varR;
            yield return new WaitForSeconds(.01f);
        }
    }

    IEnumerator FeetEffectorOff()
    {
        float varL = FullBody.solver.leftFootEffector.positionWeight;
        float varR = FullBody.solver.rightFootEffector.positionWeight;

        while (varL > 0 || varR > 0)
        {
            varL -= .01f;
            varR -= .01f;
            FullBody.solver.leftFootEffector.positionWeight = varL;
            FullBody.solver.rightFootEffector.positionWeight = varR;
            yield return new WaitForSeconds(.01f);
        }
    }
}
