// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function order_potential(){
	var listHands = [];
	while(!ds_list_empty(potential_list)){
		array_push(listHands,potential_list[|ds_list_size(potential_list)-1]);
		ds_list_delete(potential_list,ds_list_size(potential_list)-1);
	}
	
	var _f = function(inst1, inst2){
	    if(inst1.suit!=inst2.suit){
			return inst1.suit - inst2.suit;
		}else{
			return inst1.rank - inst2.rank;
		}
	}
	
	array_sort(listHands, _f);
	for (var i = 0; i < array_length(listHands); i++){
		//show_debug_message(playerHands[i].suit);
		//listHands[i].selected = false;
		ds_list_add(potential_list, listHands[i]);
	}
}