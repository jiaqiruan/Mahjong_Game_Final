// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function shuffle_deck(_given_list, _xpos, _ypos){
	ds_list_shuffle(_given_list);
	deck_reposition(_given_list, _xpos, _ypos);
}