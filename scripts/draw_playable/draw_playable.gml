// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_playable(_amount){
	discard_playable();
	for (var _i = 0; _i < _amount; _i++){
		var _card_drawn = deck_list[|ds_list_size(deck_list)-1];
		//in playable hand, should be selectable
		_card_drawn.selectable = true;
		_card_drawn.face_up = true;
		ds_list_add(playable_list, _card_drawn);
		ds_list_delete(deck_list, ds_list_size(deck_list)-1);
	}
	deck_reposition(playable_list,playable_xpos,playable_ypos);
	deck_reposition(deck_list,general_xpos,general_ypos);
}