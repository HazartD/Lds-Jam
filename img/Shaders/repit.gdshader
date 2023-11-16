shader_type canvas_item;
uniform float repit:hint_range(0.0, 1.0)=0.1;
void fragment() {
	vec2 uv=UV;
	uv.x+= TIME*repit;
	uv.y-= TIME*repit;
	COLOR=texture(TEXTURE,uv);
}
