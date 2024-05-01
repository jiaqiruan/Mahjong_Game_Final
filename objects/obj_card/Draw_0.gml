/// @description Insert description here
// You can write your code in this editor
draw_self();

if(listening){
	draw_set_color(c_red);
	draw_circle(x, y-50, 5, false);
}else{
	if (potential){
		draw_set_color(c_white);
		draw_circle(x, y-50, 5, false);
	}
}

