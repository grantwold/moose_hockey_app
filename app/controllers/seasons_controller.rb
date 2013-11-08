class SeasonsController < ApplicationController
	def new
		@season = Season.new
	end

	def create
		@season = Season.new(params[:season])
		if @season.save
			flash[:success] = "New Season Created"
			redirect_to @season
		else
			render 'new'
		end
	end

	def show
		@season = Season.find(params[:id])
		@players = @season.players.all
	end

	def edit
		@season = Season.find(params[:id])
	end

	def update
		@season = Season.find(params[:id])
		if @season.update_attributes(params[:season])
			flash[:success] = "Season Updated"
			redirect_to season_path(@season)
		else
			render 'edit'
		end
	end
end
