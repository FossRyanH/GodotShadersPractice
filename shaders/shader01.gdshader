shader_type canvas_item;

uniform float speed: hint_range(1.0, 10.0, 0.25) = 5.0;

void vertex()
{
	// Called for every vertex the material is visible on.
	if (VERTEX.y < 0.0 && VERTEX.x < 0.0)
	{
		vec2 circle = vec2(cos(TIME * speed) * 100.0,
		sin(TIME * speed) * 100.0);
		VERTEX += vec2(-200.0, -50.0) + circle;
	}
}

void fragment()
{
	// Called for every pixel the material is visible on.
	vec4 color1 = vec4(1.0, 0., 0., 1.0);
	vec4 color2 = vec4(0.0, 0.0, 1.0, 1.0);
	
	float mix_percentage = (sin(TIME * 2.0) + 1.0) * 0.5;
	vec4 output_color = mix(color1, color2, mix_percentage);
	
	COLOR = texture(TEXTURE, UV) * output_color;
}

//void light()
//{
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
