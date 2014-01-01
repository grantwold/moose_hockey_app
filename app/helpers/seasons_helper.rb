module SeasonsHelper

	def current_season=(season)
		@current_season = season
	end

	def current_season
		@current_season = Season.find_by_current_season(:true)
	end
	
end
