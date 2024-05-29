Shader "Holistic/AllProps" 
{
    Properties {
        _myDifTex ("Example Diffuse Texture", 2D) = "white" {}
        _myEmisTex ("Example Emissive Texture", 2D) = "black" {}        
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _myDifTex;
        sampler2D _myEmisTex;
        
        struct Input {
            float2 uv_myDifTex;
            float2 uv_myEmisTex;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            
            o.Albedo = tex2D(_myDifTex, IN.uv_myDifTex);
            o.Emission = tex2D(_myEmisTex, IN.uv_myEmisTex);
        }
      
      ENDCG
    }
    Fallback "Diffuse"
  }
