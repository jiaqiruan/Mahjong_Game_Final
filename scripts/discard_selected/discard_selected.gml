// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function discard_selected(){
	global.player_selected_card = noone;
	var _index_arr= [];
	for (var _i = ds_list_size(player_list)-1; _i >= 0; _i--){
		if(player_list[|_i].selected){
			var _selected_card = player_list[|_i];
			_selected_card.in_player_hand = false;
			_selected_card.selectable = false;
			_selected_card.selected = false;
			//keep track of removing card from player hand
			card_tracker[_selected_card.uid]--;
			//add all select card to discard list
			ds_list_add(discard_list,_selected_card);
			//remember the index of selected card
			array_push(_index_arr,_i);
		}
	}
	for (var _i = 0; _i < array_length(_index_arr); _i++){
		//delete all index from player hand
		ds_list_delete(player_list,_index_arr[_i]);
	}

	deck_reposition(player_list, player_xpos, player_ypos);
	deck_reposition(discard_list, discard_xpos, discard_ypos);
}