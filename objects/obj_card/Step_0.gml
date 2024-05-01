//face up and down
if(face_up){
	sprite_index = front_spr;
}else{
	sprite_index = back_spr;
}

//select the card
if(mouse_check_button_pressed(mb_left)){
	if(collision_point(mouse_x, mouse_y, self, false, false)&&selectable){
		if(!selected){
			//select card in player hand
			//if multi select disable, only select one card at a time
			if(in_player_hand&&!global.multi_select_player){
				if(global.player_selected_card != noone){
					//deselect selected card
					global.player_selected_card.y += 50;
					global.player_selected_card.selected = false;
				}
				global.player_selected_card = self;
			}
			//if card in playable and multi-select playable disable
			if(!in_player_hand&&!global.multi_select_playable){
				if(global.playable_selected_card != noone){
					//deselect selected card
					global.playable_selected_card.y += 50;
					global.playable_selected_card.selected = false;
				}
				global.playable_selected_card = self;
			}
			//moving up indicating selecting
			y -= 50;
			selected = true;
		}else{
			//de-select card in player hand
			
			//if in player hand and multi select disable
			//remember to set global reference to noone
			if(in_player_hand&&!global.multi_select_player){
				global.player_selected_card = noone;
			}
			//if card in playable and multi-select playable disable
			if(!in_player_hand&&!global.multi_select_playable){
				global.playable_selected_card = noone;
			}
	
			//moving down indicating de-selecting
			y += 50;
			selected = false;
		}
	}
}