class TeamsController < ApplicationController
	def new
		@team = Team.new
	end

	def create
		@team = Team.new(params[:team])
		if @team.save
			flash[:success] = "New Season created"
			redirect_to @team
		else
			render 'new'
		end
	end

	def show
		@team = Team.find(params[:id])
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])
		if @team.update_attributes(params[:player])
			flash[:success] = "Team Updated"
			redirect_to team_path(@team)
		else
			render 'edit'
		end
	end
end