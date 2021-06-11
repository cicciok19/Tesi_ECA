using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PumpPosition : PlaceObjectPosition
{

    protected override AnimationCurve SetPositionWeight()
    {
        return SetGaussianCurve(0, 1, 4);
    }

    protected override AnimationCurve SetPoserWeight()
    {
        AnimationCurve curve;

        Keyframe[] ks = new Keyframe[15];

        ks[0] = new Keyframe(0,1);

        for(int i = 1; i < 15; i = i + 2)
            ks[i] = new Keyframe(i / 2, 1);

        for (int i = 2; i <= 14; i = i + 2)
            ks[i] = new Keyframe(i / 2, .5f);

        curve = new AnimationCurve(ks);
        return curve;
    }


}
