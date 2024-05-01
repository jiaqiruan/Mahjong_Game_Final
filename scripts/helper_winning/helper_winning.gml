//card is the current card on hand
//pair count is num of pair
//triplet is num of triplet
function helper_winning(card, pair_count, triplet_count){
	//ignoring other winnning hand, the most common winning hand come down to 4 triplet and 1 pair
	if(pair_count == 1 && triplet_count == 4){
		return true;
	}
	//checking through 
	for (var i = 0; i<array_length(card); i++){
		if(card[i]==0){
			continue;
		}
		// in trio
        if(card[i] >= 3){
			card[i] -= 3;
			if (helper_winning(card, pair_count, triplet_count + 1)) {
				return true;
            }
			card[i] += 3;
		}
		// in pair
		if(card[i] >= 2&& pair_count==0){
			card[i] -= 2;
			if (helper_winning(card, pair_count+1, triplet_count)) {
				return true;
            }
			card[i] += 2;
		}
		// in sequence
		if(i>=1 && i <=9){
			if (i + 2 <= 9 && card[i] >= 1 && card[i+1] >= 1 && card[i+2] >= 1){
				card[i] -= 1;
                card[i+1] -= 1;
                card[i+2] -= 1;
				if(helper_winning(card,pair_count,triplet_count+1)){
					return true;
				}
				card[i] += 1;
                card[i+1] += 1;
                card[i+2] += 1;
			}
		}
		if (i>=11 && i<=19){
			if (i + 2 <= 19 && card[i] >= 1 && card[i+1] >= 1 && card[i+2] >= 1){
				card[i] -= 1;
                card[i+1] -= 1;
                card[i+2] -= 1;
				if(helper_winning(card,pair_count,triplet_count+1)){
					return true;
				}
				card[i] += 1;
                card[i+1] += 1;
                card[i+2] += 1;
			}
		}
		if (i>=21 && i<=29){
			if (i + 2 <= 29 && card[i] >= 1 && card[i+1] >= 1 && card[i+2] >= 1){
				card[i] -= 1;
                card[i+1] -= 1;
                card[i+2] -= 1;
				if(helper_winning(card,pair_count,triplet_count+1)){
					return true;
				}
				card[i] += 1;
                card[i+1] += 1;
                card[i+2] += 1;
			}
		}
	}
	return false;
}