namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		Rake::Task['db:reset'].invoke
		make_players
		# make_seasons
		make_game
	end
end

def make_players
	Faker::Config.locale = :en
	20.times do |n|
		name					= Faker::Name.name
		number					= rand(100)
		position_options		= ["Defense", "Right Wing", "Left Wing", "Center", "Goalie"]
		position 				= position_options[rand(position_options.length)]
		Player.create!(name: 			 name,
					   number: 			 number,
					   position: 		 position)
	end
end

# def make_seasons
#	Faker::Config.locale = :en
#	5.times do |n|
#		name 			= "#{Faker::Name.name} tournament"
#		year_options 	= ["2011", "2012", "2013", "2014"]
#		month_options 	= rand(1..12)
#		day_options 	= rand(1..28)
#		season_end 		= "#{year_options.sample}-#{month_options}-#{day_options}".to_date
#		month_ago		= rand(1..8)
#		season_start 	= season_end - month_ago.month
#		Season.create!(name: 	   name,
#					 season_start: season_start,
#					 season_end:   season_end)
#	end
# end

def make_game
	Faker::Config.locale = :en
	20.times do |n|
		month_options = rand(1..5)
		year_options = "2013"
		day_options = rand(1..28)
		date = "#{month_options}/#{day_options}/#{year_options}"
		hour_options = rand(3..10)
		minute_options = ["00", "15", "30", "45"]
		time = "#{hour_options}:#{minute_options.sample}pm"
		location_option = ["Breck", "SLP", "WestSide", "New Hope"]
		location = "#{location_option.sample}"
		opponent = Faker::Name.lastname
		official = "true"
		scrimmage = "false"
		practice = "false"
		moose_goals = rand(0..8)
		opponent_goals = rand(0..8)
		moose_assists = rand(0..12)
		opponent_assists = rand(0..12)
		moose_shg = rand(0..3)
		opponent_shg = rand(0..3)
		moose_ppg = rand(0..4)
		opponent_ppg = rand(0..4)
		moose_penalties = rand(0..16)
		opponent_penalties = rand(0..16)
		

