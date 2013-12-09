FactoryGirl.define do 
	factory :player do
		name    	 	"Example Player"
		position		 "Right Wing"
		number       	 "00"
		gamesplayed  	 "18"
	end

	factory :season do
		season_start "12/08/2013"
		season_end	 "12/09/2013"
		name		 "AHA 2012 Season"
	end

	factory :statistic do
		goals        	 "15"
		assists      	 "10"
		shorthandedgoals "1"
		powerplaygoals   "3"
		penalties        "12"
	end

	factory :game do
		location "Breck"
		opponent "Ice Dogs"
		time	 "18:00"
		date	 "12/08/2013"
		official "true"
	end
end