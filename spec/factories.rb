FactoryGirl.define do 
	factory :player do
		name    	 	"Example Player"
		position		 "Right Wing"
		number       	 "00"
	end

	factory :season do
		season_start "12/08/2013"
		season_end	 "12/09/2013"
		name		 "AHA 2012 Season"
	end

	factory :game do
		location 			   "Breck"
		opponent 			   "Ice Dogs"
		time	 			   "6:00pm"
		date	 			   "12/08/2013"
		official 			   "true"
		scrimmage 			   "false"
		practice 			   "false"
		moose_goals 		   "5"
		opponent_goals 	   	   "4"
		moose_assists 		   "8"
		opponent_assists 	   "4"
		moose_shg 			   "1"
		opponent_shg 		   "0"
		moose_ppg 			   "2"
		opponent_ppg 		   "1"
		moose_penalties 	   "6"
		opponent_penalties 	   "10"
		moose_shots_on_goal    "45"
		opponent_shots_on_goal "20"
		season
	end
end