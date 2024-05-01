// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function check_potential(){
	//which kind of event
	//0 for nothing, 1 for kong and 2 for pung and chow
	var event_result = 0;
	//first clear any previous potential
	ds_list_clear(potential_list);
	//probably we need to track how many selected cards in both player and playable
	var player_selected = 0;
	var playable_selected = 0;
	//add selected card in player hand to potential
	for (var i = ds_list_size(player_list)-1; i >= 0; i--){
		if(player_list[|i].selected){
			player_selected++;
			ds_list_add(potential_list,player_list[|i]);
		}
	}
	//add selected card in playable pool to potential
	for (var i = ds_list_size(playable_list)-1; i >= 0; i--){
		if(playable_list[|i].selected){
			playable_selected++;
			ds_list_add(potential_list,playable_list[|i]);
		}
	}
	//for kong, player card = 3, playable card = 1
	//for chow and pung, player card = 2, playable card = 1
	//for future addons, such as straight or flush, player card = 4, playable card = 1
	//there have to be exactly 1 playable card, if not it is a invalid hand
	if (playable_selected !=1){
		return 0;
	}
	
	
	//order it
	order_potential();
	
	//if size of potential is less than 2 or greater than 5
	//invalid potential
	//result event_result as 0
	if(ds_list_size(potential_list)<=2 || ds_list_size(potential_list)>5){
		show_debug_message("Invalid Hand!");
		event_result = 0;
		order_list(playable_list,playable_xpos,playable_ypos)
		order_list(player_list,player_xpos,player_ypos);
	}else{
		//potential straight
		if(ds_list_size(potential_list)==5){
			var straight_suit = potential_list[|0].suit;
			var straight_rank = potential_list[|0].rank;
			for(var i = 1; i <ds_list_size(potential_list); i++){
				
				if (potential_list[|i].suit != straight_suit || potential_list[|i].rank != straight_rank+1){
					
					show_debug_message("Invalid Hand!");
					order_list(playable_list,playable_xpos,playable_ypos)
					order_list(player_list,player_xpos,player_ypos);
					break;
				}
				straight_rank = potential_list[|i].rank;
			}
			//all good, move all card to the score deck
			//event result 3 indicating straight event
			//draw 1
			event_result = 3;
			game_score += straight_score;
			selected_to_score();
		}
		//potential kong
		if (ds_list_size(potential_list)==4){
			var kong_suit = potential_list[|0].suit;
			var kong_rank = potential_list[|0].rank;
			for (var i = 1; i <ds_list_size(potential_list); i++){
				//check if every card in potential have same suit and rank
				if (potential_list[|i].suit != kong_suit || potential_list[|i].rank != kong_rank){
					show_debug_message("Invalid Hand!");
					order_list(playable_list,playable_xpos,playable_ypos)
					order_list(player_list,player_xpos,player_ypos);
					break;
				}
			}
			//all good, move all card to the score deck
			//event result 1 indicating kong event
			//draw 1, discard 1
			event_result = 1;
			game_score += kong_score;
			selected_to_score();
		}
		//potential pung
		if(ds_list_size(potential_list)==3){
			//only suit match will result in pung or chow
			if (potential_list[|0].suit == potential_list[|1].suit && potential_list[|2].suit == potential_list[|1].suit ){
				//pung
				if (potential_list[|0].rank == potential_list[|1].rank && potential_list[|2].rank == potential_list[|1].rank){
					//discard 1
					event_result = 2;
					game_score += pung_score;
					selected_to_score();
				}
				//only suit 1, 2 and 3 have chow
				if (potential_list[|0].suit<=3 && potential_list[|0].rank+1 == potential_list[|1].rank && potential_list[|1].rank+1 == potential_list[|2].rank){
					//discard 1
					event_result = 2;
					game_score += chow_score;
					selected_to_score();
				}
			}else{
				show_debug_message("Invalid Hand!");
				order_list(player_list,player_xpos,player_ypos);
				order_list(playable_list,playable_xpos,playable_ypos);
			}
		}
	}
	return event_result;
}