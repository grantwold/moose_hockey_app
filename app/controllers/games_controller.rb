class GamesController < ApplicationController

	def new
		@game = Game.new
	end

	def create
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
		@game = Game.build(params[:game])
		@game.season_id = params[:game][:season_id]
		if @game.save
			flash[:success] = "New game created"
			redirect_to @game
		else
			render 'new'
		end
	end

	def show
		@game = Game.find(params[:id])
	end

	def edit
		@game = Game.find(params[:id])
	end

	def update
		@game = Game.find(params[:id])
		if  @game.update_attributes(params[:game])
			flash[:success] = "Game Updated"
			redirect_to game_path(@game)
		else
			render 'edit'
		end
	end
end