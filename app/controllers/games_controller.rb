class GamesController < ApplicationController

	def new
		@game = Game.new
	end

	def create
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
		@game = Game.new(params[:game])
		if @game.save
			flash[:success] = "New game created"
			redirect_to @game
		else
			render 'new'
		end
	end
end