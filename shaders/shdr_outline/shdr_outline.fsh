//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelW;
uniform float pixelH;


void main()
{
	vec2 offsetx;
	offsetx.x = pixelW;
	vec2 offsety;
	offsety.y = pixelW;
	
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord).a;
	
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetx.x).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetx.x).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetx.y).a);
	alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetx.y).a);
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a = alpha;
}
