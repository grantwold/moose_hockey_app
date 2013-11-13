class StatisticsController < ApplicationController

	def new
		@statistic = Statistic.new(params[:id])
	end
end
