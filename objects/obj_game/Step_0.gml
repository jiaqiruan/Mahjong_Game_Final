//order player hand
if(game_score>=needed_score){
	room_restart();
}

if(keyboard_check_pressed(ord("S"))){
	order_list(player_list,player_xpos,player_ypos);
}
if(keyboard_check_pressed(ord("W"))){
	if(game_state=="wait_play"&&global.playable_selected_card!=noone){
		show_debug_message("am i?");
		var _tmp_list = ds_list_create();
		ds_list_copy(_tmp_list,player_list);
		card_tracker[global.playable_selected_card.uid]++;
		ds_list_add(_tmp_list,global.playable_selected_card);
		
		if(check_winning(_tmp_list)){
			room_restart();
			show_debug_message("winning hand!");
		}else{
			show_debug_message("not winning");
		}
		card_tracker[global.playable_selected_card.uid]--;
		show_debug_message(_tmp_list[|ds_list_size(_tmp_list)-1].card_name);
		ds_list_destroy(_tmp_list);
	}else{
		if(check_winning(player_list)){
			room_restart();
			show_debug_message("winning hand!");
		}else{
			show_debug_message("not winning");
		}
	}
}

//different game state
switch(game_state){
	
	//decision state
	//player have two decision
	//draw or play
	case "decision":
		//press D, draw a hand, enter the discard state
		if((keyboard_check_pressed(ord("D")))){
			//draw n cards, for now 1
			draw_hands(draw_amount);
			//entering discard state, disable multi-select player
			global.multi_select_player = false;
			game_state = "discard";
		}
		//press E, draw n numbers of playable hands, enter the play state
		if(keyboard_check_pressed(ord("E"))){
			draw_playable(playable_amount);
			game_state = "play";
		}
		break;
		
		
	
	//discard state
	//after player draw n cards, they have to discard n cards
	case "discard":
		//discard all selected card
		if((keyboard_check_pressed(vk_enter))){
			discard_selected();
			global.multi_select_player = true;
			game_state = "decision";
		}
		break;
	
	//play staet
	//player draw n cards to the playable pool
	//show all potential card
	//wait for player to respond
	
	
	case "play":
		
		for(var _i=0; _i<ds_list_size(playable_list);_i++){
			var _current = playable_list[|_i];
			//check adjacency
			if((_current.uid>1 && card_tracker[_current.uid-1]>0) || card_tracker[_current.uid]>0 || (_current.uid<29 && card_tracker[_current.uid+1]>0)){
				var _check_player_list = ds_list_create();
				ds_list_copy(_check_player_list,player_list);
				//add current hand to tmp list
				ds_list_add(_check_player_list, _current);
				card_tracker[_current.uid]++;
				if(check_winning(_check_player_list)){
					_current.listening =  true;
					show_debug_message("Winning hand: "+_current.card_name);
				}else{
					show_debug_message("Not winning");
				}
				card_tracker[_current.uid]--;
				ds_list_destroy(_check_player_list);
			}
		}
		find_potential();
		game_state = "wait_play";
		break;
	case "wait_play":
		//another thing during the wait play state we should do
		//is to check whether we are listening to a specific hand for winning hand
		//if that hand exist, we can declare a winning hand
		//the algorithm goes as follow
		//go through all playable hand
		//if in the card tracker array, there exist an adjacent hand for that playable hand
		//that is, cardtrack[uidindex-1]>0 or cardtrack[uidindex]>0 pr cardtrack[uidindex+1]>0
		//add this hand to player list temporary and check winning
		//if can win, offer a way to declare winning hand
		
	
	
		global.multi_select_player = true;
		if(keyboard_check_pressed(vk_enter)){
			var tmp_result = check_potential();
			switch(tmp_result){
				//nothing happen
				case 0:
					
					break;
				case 1:
					game_state = "draw";
					break;
				case 2: 
					global.multi_select_player = false;
					game_state = "discard";
					break;
				case 3:
					game_state = "draw2";
					break;
			}
		}
		if(keyboard_check_pressed(vk_escape)){
			discard_playable();
			game_state = "decision";
		}
		break;
	//draw state, draw one and discard 1
	case "draw":
		draw_hands(1);
		//entering discard state, disable multi-select player
		global.multi_select_player = false;
		game_state = "discard";
		break;
	case "draw2":
		draw_hands(2);
		//entering discard state, disable multi-select player
		global.multi_select_player = false;
		game_state = "discard";
		break;
}