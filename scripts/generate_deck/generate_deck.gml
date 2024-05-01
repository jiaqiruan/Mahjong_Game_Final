// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function generate_deck(){
	for (var i = 1; i <= 3 ; i++){
		//starting from suit 1, dot
		//every tile have four card
		for (var j = 1; j <= 9 ; j++){
			for (var n = 0; n <4 ; n++) {
				var mahjongcard = instance_create_layer(0,0,"Instances",obj_card);
				mahjongcard.suit = i;
				mahjongcard.rank = j;
				mahjongcard.uid = ((i-1)*10)+j;
				//re-assign sprite to the card
				determine_card(mahjongcard);
				ds_list_add(deck_list, mahjongcard);
			}
		}
	}
}