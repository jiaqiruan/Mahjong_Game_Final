// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_winning(_list_given){
	
	if (ds_list_size(_list_given)+(num_triplet*3) > 14) {
		return false;
    }
	var _tmp_card = [];
	
	array_copy(_tmp_card,0,card_tracker, 0,array_length(card_tracker));
	
	return helper_winning(_tmp_card,0,num_triplet);
}