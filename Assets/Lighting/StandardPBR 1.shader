Shader "Holistic/StandardPBR"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MetallicTex ("Albedo (RGB)", 2D) = "white" {}
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _Emission ("Emisison", Range(0.0,10.0)) = 0.5
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }
        

        CGPROGRAM
        
        #pragma surface surf Standard 

       
        sampler2D _MetallicTex;
        half _Metallic;
        fixed4 _Color;
        half _Emission;

        struct Input
        {
            float2 uv_MetallicTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _Color.rgb;
            o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
            o.Metallic = _Metallic;
            o.Emission = tex2D(_MetallicTex, IN.uv_MetallicTex).r*_Emission;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
