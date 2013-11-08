class TeamsController < ApplicationController
	def new
		@team = Team.new
	end

	def create
		@team = Team.new(params[:team])
		if @team.save
			flash[:success] = "New team created"
			redirect_to @team
		else
			render 'new'
		end
	end

	def show
		@team = Team.find(params[:id])
		@players = @team.players.all
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])
		if @team.update_attributes(params[:team])
			flash[:success] = "Team Updated"
			redirect_to team_path(@team)
		else
			render 'edit'
		end
	end
end