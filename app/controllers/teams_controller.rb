class seasonsController < ApplicationController
	def new
		@season = season.new
	end

	def create
		@season = season.new(params[:season])
		if @season.save
			flash[:success] = "New season created"
			redirect_to @season
		else
			render 'new'
		end
	end

	def show
		@season = season.find(params[:id])
		@players = @season.players.all
	end

	def edit
		@season = season.find(params[:id])
	end

	def update
		@season = season.find(params[:id])
		if @season.update_attributes(params[:season])
			flash[:success] = "season Updated"
			redirect_to season_path(@season)
		else
			render 'edit'
		end
	end
end