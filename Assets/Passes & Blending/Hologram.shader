Shader "Holistic/Hologram"
{
    Properties
    {
        _RimColor ("Rim Color", Color) = (0,0.5,0.5,0)
        _RimPower ( "Rim Power", Range(0.5,8.0)) = 3.0
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }
        
        Pass {
            Zwrite On
            ColorMask 0
        }

        CGPROGRAM
        #pragma surface surf Lambert alpha:fade

        sampler2D _MainTex;
        float4 _RimColor;
        float _RimPower;

        struct Input
        {
            float2 uv_MainTex;
            float3 viewDir;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1.0 - saturate(dot (normalize(IN.viewDir), o.Normal));
            o.Emission = _RimColor.rgb * pow(rim, _RimPower);
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) *10;
            o.Alpha = pow (rim, _RimPower);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
