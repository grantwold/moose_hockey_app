class PlayersController < ApplicationController

	def new
		@player = Player.new
	end

	def show
		@player = Player.find(params[:id])
		@seasons = @player.seasons.all
	end

	def create
		@player = Player.new(params[:player])
		if @player.save
			flash[:success] = "New player created"
			redirect_to @player
		else
			render 'new'
		end
	end

	def edit
		@player = Player.find(params[:id])
	end

	def update
		@player = Player.find(params[:id])
		if @player.update_attributes(params[:player])
			flash[:success] = "Player Updated"
			redirect_to player_path(@player)
		else
			render 'edit'
		end
	end
end