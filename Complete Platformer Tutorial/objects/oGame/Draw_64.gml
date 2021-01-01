/// @description Draw Score


// This allows us to Draw the score to every room that isnt our Menu

//if (live_call()) return live_result;

if (room != RoomMenu) && (instance_exists(oPlayer)) && (global.kills > 0)
{
	killtextscale = max(killtextscale * 0.95, 1);
	DrawSetText(c_black,fMenu,fa_right, fa_top);
	draw_text_transformed(RES_H+230,15,string(global.kills) + " Pointless Murders",killtextscale,killtextscale,0)
	draw_set_color(c_white);
	draw_text_transformed(RES_H+230,14,string(global.kills) + " Pointless Murders",killtextscale,killtextscale,0)
}