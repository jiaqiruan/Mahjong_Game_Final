// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function discard_playable(){
	//poping every element from the playable list
	while(!ds_list_empty(playable_list)){
		var _discard_card = playable_list[|0];
		_discard_card.selected = false;
		_discard_card.selectale = false;
		_discard_card.potential = false;
		_discard_card.listening = false;
		ds_list_add(discard_list,_discard_card);
		ds_list_delete(playable_list,0);
	}
	deck_reposition(playable_list,playable_xpos,playable_ypos);
	deck_reposition(discard_list,discard_xpos,discard_ypos);
}