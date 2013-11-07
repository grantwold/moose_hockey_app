FactoryGirl.define do 
	factory :player do
		name    	 	"Example Player"
		position		 "Right Wing"
		number       	 "00"
		gamesplayed  	 "18"
		goals        	 "15"
		assists      	 "10"
		shorthandedgoals "1"
		powerplaygoals   "3"
		penalties        "12"
	end

	factory :team do
		season_start "2012-10-27"
		season_end	 "2013-4-15"
		name		 "AHA 2012 Season"
	end
end