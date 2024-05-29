Shader "Holistic/Rim"
{
    Properties
    {
        _MyDiffuse ("Diffuse Texture", 2D) = "white" {}
        _RimColor ("Rim Color", Color) = (0, 0.5,0.5,0.0)
        _RimPower ("Rim Power", Range(0.5, 8.0)) = 3.0
        _StripWidth ("Strip Width", Range(0, 20)) = 10.0
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        float4 _RimColor;
        float _StripWidth;
        float _RimPower;
        sampler2D _MyDiffuse;

        struct Input
        {
            float3 viewDir;
            float3 worldPos;
            float2 uv_MyDiffuse;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
            o.Emission = frac(IN.worldPos.y * (20-_StripWidth) * 0.5) > 0.4 ? float3(0,1,0)*rim : float3(1,0,0)*rim;
            o.Albedo = tex2D(_MyDiffuse, IN.uv_MyDiffuse).rgb;
            //pow(rim, _RimPower)
        }
        ENDCG
    }
    FallBack "Diffuse"
}
