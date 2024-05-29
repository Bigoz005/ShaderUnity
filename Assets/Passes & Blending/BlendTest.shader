Shader "Holistic/BlendTest"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "black" {}   
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        Blend DstColor One
        Pass{
            
            SetTexture [_MainTex]{
                combine texture
            }
        }


    }
}
