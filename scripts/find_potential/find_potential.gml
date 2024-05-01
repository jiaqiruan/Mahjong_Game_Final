// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_potential(){
	order_list(player_list,player_xpos,player_ypos);
	order_list(playable_list,playable_xpos,playable_ypos);
	potential_pungs = [
		[],
		[false, new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false)],
		[false, new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false)],
		[false, new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false)],
		[false,  new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false)],
		[false,  new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false)]
	];
	potential_chows = [
		[],
		[false, new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false)],
		[false, new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false)],
		[false, new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false)],
		[false,  new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false)],
		[false,  new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false)]
	];
	potential_kongs = [
		[],
		[false, new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false)],
		[false, new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false)],
		[false, new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false),new PotentialHand([],false)],
		[false,  new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false),new PotentialHand([],false)],
		[false,  new PotentialHand([],false), new PotentialHand([],false), new PotentialHand([],false)]
	];
	//checking all potential chows, pungs and kongs based on player hands
	for (var i = 0 ; i < ds_list_size(player_list) ; i++){
		//checking for potential pung
		if (i<ds_list_size(player_list)-1 && player_list[|i].suit == player_list[|i+1].suit && player_list[|i].rank == player_list[|i+1].rank){
			potential_pungs[player_list[|i].suit][player_list[|i].rank].index_arr = [i,i+1];
			potential_pungs[player_list[|i].suit][player_list[|i].rank].is_potential = true;
			//show_debug_message("Potential Pung: "+mahjongHands[player_list[|i].suit][player_list[|i].rank]);
		}
		//checking for potential kong
		if (i<ds_list_size(player_list)-2 && player_list[|i].suit == player_list[|i+1].suit && player_list[|i+1].suit ==  player_list[|i+2].suit && player_list[|i].rank == player_list[|i+1].rank && player_list[|i+1].rank ==  player_list[|i+2].rank){
			potential_kongs[player_list[|i].suit][player_list[|i].rank].index_arr = [i,i+1,i+2];
			potential_kongs[player_list[|i].suit][player_list[|i].rank].is_potential = true;
			//show_debug_message("Potential Kong: "+mahjongHands[player_list[|i].suit][player_list[|i].rank]);
			
		}
		//checking for potential chow
		if (i<ds_list_size(player_list)-1 && player_list[|i].suit <= 3 && player_list[|i].suit == player_list[|i+1].suit){
			//adjacent straight
			if  (player_list[|i+1].rank-player_list[|i].rank == 1){
				//have 1 and 2, waiting for 3
				if(player_list[|i].rank == 1){
					potential_chows[player_list[|i].suit][3].index_arr = [i,i+1];
					potential_chows[player_list[|i].suit][3].is_potential = true;
					//show_debug_message("Potential Chow: "+mahjongHands[player_list[|i].suit][3]);
				}
				//have 8 and 9, waiting for 7
				else if (player_list[|i+1].rank == 9){
					potential_chows[player_list[|i].suit][7].index_arr = [i,i+1];
					potential_chows[player_list[|i].suit][7].is_potential = true;
					//show_debug_message("Potential Chow: "+mahjongHands[player_list[|i].suit][7]);
				}
				//two-side straight waiting, example: have 2 and 3, waiting for 1 and 4
				else {
					potential_chows[player_list[|i].suit][player_list[|i].rank-1].index_arr = [i,i+1];
					potential_chows[player_list[|i].suit][player_list[|i].rank-1].is_potential = true;
					potential_chows[player_list[|i+1].suit][player_list[|i+1].rank+1].index_arr = [i,i+1];
					potential_chows[player_list[|i+1].suit][player_list[|i+1].rank+1].is_potential = true;
					//show_debug_message("Potential Chow: "+mahjongHands[player_list[|i].suit][player_list[|i].rank-1]);
					//show_debug_message("Potential Chow: "+mahjongHands[player_list[|i+1].suit][player_list[|i+1].rank+1]);
				}
			}
			//interval straight, example have 1 and 3, waiting for 2
			if (player_list[|i+1].rank-player_list[|i].rank == 2){
				potential_chows[player_list[|i].suit][player_list[|i].rank+1].index_arr = [i,i+1];
				potential_chows[player_list[|i].suit][player_list[|i].rank+1].is_potential = true;
				//show_debug_message("Potential Chow: "+mahjongHands[player_list[|i].suit][player_list[|i].rank+1]);
			}
		}
	}
	for (var i = 0 ; i < ds_list_size(playable_list) ; i ++ ){
		var uid = playable_list[|i].uid;
		//experimenting with a new way of detecting straight
		//first, straight only happen in suit 1 t o 3
		//we have a card_tracker to keep track of all cards in hand
		//for every card in playable pool
		
		
		
		
		
		
		
		
		
		
		
		//dot1 to dot5(1-5), bamboo1 to bamboo5(11-15), wan1 to wan5(21-25)
		//index+1,index+2,index+3,index+4, being the head of straight, 1 to 5
		if((uid>=1&&uid<=5)||(uid>=11&&uid<=15)||(uid>=21&&uid<=25)){
			if(card_tracker[uid+1]>0&&card_tracker[uid+2]>0&&card_tracker[uid+3]>0&&card_tracker[uid+4]>0){
				playable_list[|i].potential = true;
				show_debug_message("Potential Straight: "+mahjong_hands[playable_list[|i].suit][playable_list[|i].rank]);
			}
		}
		
		//dot2 to dot6(2-6), bamboo2 to bamboo6(12-16), wan2 to wan6(22-26)
		//index-1,index+1,index+2,index+3, being the second of straight, 2 to 6
		if((uid>=2&&uid<=6)||(uid>=12&&uid<=16)||(uid>=22&&uid<=26)){
			if(card_tracker[uid+1]>0&&card_tracker[uid+2]>0&&card_tracker[uid+3]>0&&card_tracker[uid-1]>0){
				playable_list[|i].potential = true;
				show_debug_message("Potential Straight: "+mahjong_hands[playable_list[|i].suit][playable_list[|i].rank]);
			}
		}
		
		//dot3 to dot7(3-7), bamboo3 to bamboo7(13-17), wan3 to wan7(23-27)
		////index-2,inedx-2,index+1,index+2, being the middle of straight, 3 to 7
		if((uid>=3&&uid<=7)||(uid>=13&&uid<=17)||(uid>=23&&uid<=27)){
			if(card_tracker[uid+1]>0&&card_tracker[uid+2]>0&&card_tracker[uid-1]>0&&card_tracker[uid-2]>0){
				playable_list[|i].potential = true;
				show_debug_message("Potential Straight: "+mahjong_hands[playable_list[|i].suit][playable_list[|i].rank]);
			}
		}
		
		//dot4 to dot8(4-8), bamboo4 to bamboo8(14-18), wan4 to wan8(24-28)
		//index-3,index-2,index-1,index+1, being the fourth of straight, 4 to 8
		if((uid>=4&&uid<=8)||(uid>=14&&uid<=18)||(uid>=24&&uid<=28)){
			if(card_tracker[uid+1]>0&&card_tracker[uid-3]>0&&card_tracker[uid-1]>0&&card_tracker[uid-2]>0){
				playable_list[|i].potential = true;
				show_debug_message("Potential Straight: "+mahjong_hands[playable_list[|i].suit][playable_list[|i].rank]);
			}
		}
		
		//dot5 to dot9(5-9), bamboo5 to bamboo9(15-19), wan5 to wan9(25-29)
		//index-4,index-3,index-2,index-1. being the tail of straight, 5 to 9
		if((uid>=5&&uid<=9)||(uid>=15&&uid<=19)||(uid>=25&&uid<=29)){
			if(card_tracker[uid-4]>0&&card_tracker[uid-3]>0&&card_tracker[uid-1]>0&&card_tracker[uid-2]>0){
				playable_list[|i].potential = true;
				show_debug_message("Potential Straight: "+mahjong_hands[playable_list[|i].suit][playable_list[|i].rank]);
			}
		}
		
		if (potential_pungs[playable_list[|i].suit][playable_list[|i].rank].is_potential){
			playable_list[|i].potential = true;
			show_debug_message("Potential Pung: "+mahjong_hands[playable_list[|i].suit][playable_list[|i].rank]+". Index of play list: "+string(potential_pungs[playable_list[|i].suit][playable_list[|i].rank].index_arr));
			
		}
		if (potential_kongs[playable_list[|i].suit][playable_list[|i].rank].is_potential){
			playable_list[|i].potential = true;
			show_debug_message("Potential Kong: "+mahjong_hands[playable_list[|i].suit][playable_list[|i].rank]+". Index of play list: "+string(potential_kongs[playable_list[|i].suit][playable_list[|i].rank].index_arr));
			
		}
		if (potential_chows[playable_list[|i].suit][playable_list[|i].rank].is_potential){
			playable_list[|i].potential = true;
			show_debug_message("Potential Chow: "+mahjong_hands[playable_list[|i].suit][playable_list[|i].rank]+". Index of play list: "+string(potential_chows[playable_list[|i].suit][playable_list[|i].rank].index_arr));
		}
	}
}