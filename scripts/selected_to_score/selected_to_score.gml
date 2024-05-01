// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function selected_to_score(){
	num_triplet ++;
	var tmpList = ds_list_create();
	for (var i = ds_list_size(player_list)-1; i >= 0; i--){
		if(player_list[|i].selected){
			player_list[|i].selected = false;
			player_list[|i].selectable = false;
			//keep track of removing card from player hand
			card_tracker[player_list[|i].uid] --;
			ds_list_add(tmpList,player_list[|i]);
			ds_list_delete(player_list, i);
		}
	}
	for (var i = ds_list_size(playable_list)-1; i >= 0; i--){
		if(playable_list[|i].selected){
			playable_list[|i].selected = false;
			playable_list[|i].selectable = false;
			playable_list[|i].potential = false;
			playable_list[|i].listening = false;
			ds_list_add(tmpList,playable_list[|i]);
			ds_list_delete(playable_list, i);
		}
	}
	order_without_repo(tmpList);
	for (var i =0 ; i < ds_list_size(tmpList); i++){
		ds_list_add(score_list, tmpList[|i]);
	}
	ds_list_destroy(tmpList);
	deck_reposition(player_list,player_xpos,player_ypos);
	deck_reposition(playable_list, playable_xpos, playable_ypos);
	deck_reposition(score_list,score_xpos,score_ypos);
	discard_playable();
}