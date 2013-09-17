namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		Rake::Task['db:reset'].invoke
		make_players
	end
end

def make_players
	Faker::Config.locale = :en
	20.times do |n|
		firstname				= Faker::Name.first_name
		lastname				= Faker::Name.last_name
		number					= rand(100)
		position_options		= ["Defense", "Right Wing", "Left Wing", "Center", "Goalie"]
		position 				= position_options[rand(position_options.length)]
		gamesplayed				= rand(10..21)
		goals					= rand(30)
		assists					= rand(30)
		shorthandedgoals		= rand(6)
		powerplaygoals			= rand(15)
		penalties				= rand(41)
		Player.create!(firstname: firstname,
					   lastname: lastname,
					   number: number,
					   position: position,
					   gamesplayed: gamesplayed,
					   goals: goals,
					   assists: assists,
					   shorthandedgoals: shorthandedgoals,
					   powerplaygoals: powerplaygoals,
					   penalties: penalties)
	end
end

