//reposition the deck based on which deck they belong to, with given starting x and y coordinates
function deck_reposition(_deck_given, _xpos, _ypos){
	for (var _i = 0; _i < ds_list_size(_deck_given); _i++){
		//separation is 50 for now
		_deck_given[|_i].x = _xpos+(_i*global.card_separation);
		_deck_given[|_i].y = _ypos;
	}
}