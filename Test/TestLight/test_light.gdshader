shader_type canvas_item;

uniform float a=10;

void fragment() {
	vec2 uv=vec2((UV.x),(UV.y));

	uv.y=uv.y+TIME;
	uv.y=fract(uv.y);
	vec4 text=texture(TEXTURE,uv);
	//text.r=0.0;
	//text.g=0.5;

	COLOR=text;
}