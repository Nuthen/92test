extern number fade;
extern vec2 step;
extern vec2 pos;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
	return transform_projection * vertex_position;
}
#endif

#ifdef PIXEL
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords )
{
	number glowDistance = distance(screen_coords, pos);
	
    vec4 texcolor = Texel(texture, texture_coords);
	color.w = (1-(glowDistance)) * fade;
	//texcolor = floor(texcolor * pow((pos.x + screen_coords.x - pos.y + screen_coords.y), 1/2) * fade);
	//texcolor += step.x - step.x + step.y - step.y;
    return texcolor * color;
}
#endif