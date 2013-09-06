class PlayersController < ApplicationController

	def new
		@player = Player.new
	end

	def show
		@player = Player.find(params[:id])
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
end
