// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function order_list(_given_list,_xpos,_ypos){
	global.playable_selected_card = noone;
	global.player_selected_card = noone;
	//first create a temporary array
	var _list_hands = [];
	//copy the list into the array
	while(!ds_list_empty(_given_list)){
		array_push(_list_hands,_given_list[|ds_list_size(_given_list)-1]);
		ds_list_delete(_given_list,ds_list_size(_given_list)-1);
	}
	
	//helper function to compare the rank of mahjong hand
	var _f = function(_inst1, _inst2){
		//if suit not match, compare suit
	    if(_inst1.suit!=_inst2.suit){
			return _inst1.suit - _inst2.suit;
		}else{
		//if suit match, compare rank
			return _inst1.rank - _inst2.rank;
		}
	}
	
	array_sort(_list_hands, _f);
	for (var _i = 0; _i < array_length(_list_hands); _i++){
		//de-select all cards when ordering
		if(_list_hands[_i].selected){
			_list_hands[_i].y += 50;
			_list_hands[_i].selected = false;
		}
		
		ds_list_add(_given_list, _list_hands[_i]);
	}
	//repostion each card
	deck_reposition(_given_list,_xpos,_ypos);
}