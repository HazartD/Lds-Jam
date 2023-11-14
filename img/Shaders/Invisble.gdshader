shader_type canvas_item;
uniform float modifica: hint_range(0.0, 1.0)=0;
void fragment() {
	COLOR.a=modifica;
}
