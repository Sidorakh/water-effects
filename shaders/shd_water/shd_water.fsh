//
// Simple water shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
uniform vec3 waterColor;
void main()
{
	float dist = sin(v_vTexcoord.x*3.141592654);
    vec2 coord = vec2(v_vTexcoord.x + dist*(1.0 - v_vTexcoord.y)*(sin(v_vTexcoord.y+time/500.0 + v_vTexcoord.x/500.0))/10.0,v_vTexcoord.y);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, coord) + vec4(waterColor*0.5,v_vColour.a);
}

