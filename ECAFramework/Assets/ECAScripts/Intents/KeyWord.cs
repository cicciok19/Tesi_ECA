using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KeyWord
{
    public KeyWord(double score, string type, string keyWordValue)
    {
        Score = score;
        Type = type;
        KeyWordValue = keyWordValue;
    }

    public virtual double Score { get; set; }
    public virtual string Type { get; set; }
    public virtual string KeyWordValue { get; set; }
}
