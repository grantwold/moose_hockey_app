class StatisticsController < ApplicationController

	def new
		@statistic = Statistic.new
	end
end
