// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TestQuest(){
/*

The quest controller will handle things like clearing out the listeners on an end step and run the
quest functions if they are relevant. Unfortunately this will likely lead to a bunch of statements
looking like (although only being triggered on a listener change):

repeat(amountOfQuests){
	switch(questID){
		case "0001":
			quest0001();
		break;
			case "0002":
			quest0002();
		break;
			case "0003":
			quest0003();
		break;
	}
}

The scripts themselves handle whether or not any information provided was relevant. If not they harmlessly
ignore any useless info to them. I doubt this will cause a speed issue, as it will only be a few if statements
per script check.

*/
	if(quest0001Active == 0){ //Dummy variable representing the first quest's state of activation. 0 is active, but not complete
		if(quest0001Flag[0] == 0){ //Code checking if we're on the first step/objective of quest
			if(listernerTransition == room_forest){//hypothetical global listener that holds a value for one frame if triggered
				quest0001Flag[0] = 1; //Go to next step of quest
				updateJournal(); //hypothetical journal update notification script
			}
		}
		
		if(quest0001Flag[0] == 1){
			if(listenerBattle){ //like before, a global listener signifying that a battle has concluded
				if(listOfEnemies == oGoop01_battle){ //look through the list of enemies in battle, not like this. just pseudo code
					quest0001Flag[1] += numberGoopDed; //Add the total number of relevant dead enemies to a total in the second flag spot. again, pseudo code
				}
				if(quest0001Flag[1] >= 3){ //if we have acheived the requisite amount of genocide
					quest0001Flag = 2; //update quest progress
					updateJournal();
				}
			}
		}
		
		if(quest0001Flag[0] == 2){ 
			if(listenerTalk == oCornovich){//global talking listener, only holds the value of the current talk target for a frame
				quest0001Active = 1; //finised
				questFinish(); //some kind of code for giving out rewards, although probably not in a separate function like this
			}
		}
		
	}
	
	
	
}









