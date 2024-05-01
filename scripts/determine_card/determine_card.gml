// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function determine_card(_given_card){
	//dot suit = 1, bamboo suit = 2, wan suit = 3, wind suit = 4, dragon suit = 5
	switch(_given_card.suit){
		//dot
		case 1:
			switch(_given_card.rank){
				case 1:
					_given_card.card_name = "Dot 1";
					_given_card.front_spr = spr_dot1;
					break;
				case 2:
					_given_card.card_name = "Dot 2";
					_given_card.front_spr = spr_dot2;
					break;
				case 3:
					_given_card.card_name = "Dot 3";
					_given_card.front_spr = spr_dot3;
					break;
				case 4:
					_given_card.card_name = "Dot 4";
					_given_card.front_spr = spr_dot4;
					break;
				case 5:
					_given_card.card_name = "Dot 5";
					_given_card.front_spr = spr_dot5;
					break;
				case 6:
					_given_card.card_name = "Dot 6";
					_given_card.front_spr = spr_dot6;
					break;
				case 7:
					_given_card.card_name = "Dot 7";
					_given_card.front_spr = spr_dot7;
					break;
				case 8:
					_given_card.card_name = "Dot 8";
					_given_card.front_spr = spr_dot8;
					break;
				case 9:
					_given_card.card_name = "Dot 9";
					_given_card.front_spr = spr_dot9;
					break;
			}
			break;
		//bamboo
		case 2:
			switch(_given_card.rank){
				case 1:
					_given_card.card_name = "Bamboo 1";
					_given_card.front_spr = spr_bamboo1;
					break;
				case 2:
					_given_card.card_name = "Bamboo 2";
					_given_card.front_spr = spr_bamboo2;
					break;
				case 3:
					_given_card.card_name = "Bamboo 3";
					_given_card.front_spr = spr_bamboo3;
					break;
				case 4:
					_given_card.card_name = "Bamboo 4";
					_given_card.front_spr = spr_bamboo4;
					break;
				case 5:
					_given_card.card_name = "Bamboo 5";
					_given_card.front_spr = spr_bamboo5;
					break;
				case 6:
					_given_card.card_name = "Bamboo 6";
					_given_card.front_spr = spr_bamboo6;
					break;
				case 7:
					_given_card.card_name = "Bamboo 7";
					_given_card.front_spr = spr_bamboo7;
					break;
				case 8:
					_given_card.card_name = "Bamboo 8";
					_given_card.front_spr = spr_bamboo8;
					break;
				case 9:
					_given_card.card_name = "Bamboo 9";
					_given_card.front_spr = spr_bamboo9;
					break;
			}
			break;
		//Wan
		case 3:
			switch(_given_card.rank){
				case 1:
					_given_card.card_name = "Wan 1";
					_given_card.front_spr = spr_wan1;
					break;
				case 2:
					_given_card.card_name = "Wan 2";
					_given_card.front_spr = spr_wan2;
					break;
				case 3:
					_given_card.card_name = "Wan 3";
					_given_card.front_spr = spr_wan3;
					break;
				case 4:
					_given_card.card_name = "Wan 4";
					_given_card.front_spr = spr_wan4;
					break;
				case 5:
					_given_card.card_name = "Wan 5";
					_given_card.front_spr = spr_wan5;
					break;
				case 6:
					_given_card.card_name = "Wan 6";
					_given_card.front_spr = spr_wan6;
					break;
				case 7:
					_given_card.card_name = "Wan 7";
					_given_card.front_spr = spr_wan7;
					break;
				case 8:
					_given_card.card_name = "Wan 8";
					_given_card.front_spr = spr_wan8;
					break;
				case 9:
					_given_card.card_name = "Wan 9";
					_given_card.front_spr = spr_wan9;
					break;
			}
			break;
		//Wind
		case 4:
			switch(_given_card.rank){
				case 1:
					_given_card.card_name = "East Wind";
					_given_card.sprite_index = spr_eastwind;
					break;
				case 2:
					_given_card.card_name = "South Wind";
					_given_card.sprite_index = spr_southwind;
					break;
				case 3:
					_given_card.card_name = "West  Wind";
					_given_card.sprite_index = spr_westwind;
					break;
				case 4:
					_given_card.card_name = "North Wind";
					_given_card.sprite_index = spr_northwind;
					break;
			}
			break;
		case 5:
			switch(_given_card.rank){
				case 1:
					_given_card.card_name = "Red Dragon";
					_given_card.sprite_index = spr_reddragon;
					break;
				case 2:
					_given_card.card_name = "Green Dragon";
					_given_card.sprite_index = spr_greendragon;
					break;
				case 3:
					_given_card.card_name = "White Dragon";
					_given_card.sprite_index = spr_whitedragon;
					break;
			}
			break;
	}
}