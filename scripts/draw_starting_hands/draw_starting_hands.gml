// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_starting_hands(){
	for (var _i = 0; _i < 13; _i++){
		//draw the last element from deck
		var _card_drawn = deck_list[|ds_list_size(deck_list)-1];
		//now card should face up
		_card_drawn.face_up = true;
		//also the card should be selectable
		_card_drawn.selectable = true;
		//the card is currently in player hand\
		_card_drawn.in_player_hand = true;
		//keep track
		card_tracker[_card_drawn.uid]++;
		//add to player hand
		ds_list_add(player_list, _card_drawn);
		//delete last from deck
		ds_list_delete(deck_list, ds_list_size(deck_list)-1);
	}
	
	deck_reposition(player_list,player_xpos,player_ypos);
	
	deck_reposition(deck_list,general_xpos,general_ypos);
}