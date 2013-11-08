# == Schema Information
#
# Table name: players
#
#  id               :integer          not null, primary key
#  number           :integer
#  gamesplayed      :integer
#  goals            :integer
#  assists          :integer
#  shorthandedgoals :integer
#  powerplaygoals   :integer
#  penalties        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  position         :string(255)
#  name             :string(255)
#

require 'spec_helper'

describe Player do

	before do
		@player = Player.new(name: "Example Player", 
							 number: 00,
							 position: "Right Wing",
							 gamesplayed: 18,
							 goals: 15,
							 assists: 10,
							 shorthandedgoals: 1,
							 powerplaygoals: 3,
							 penalties: 12,)
	end

	subject { @player }

	it { should respond_to(:name) }
	it { should respond_to(:position) }
	it { should respond_to(:number) }
	it { should respond_to(:gamesplayed) }
	it { should respond_to(:goals) }
	it { should respond_to(:assists) }
	it { should respond_to(:shorthandedgoals) }
	it { should respond_to(:powerplaygoals) }
	it { should respond_to(:penalties) }
	it { should have_many(:seasons).through(:memberships) }
	it { should accept_nested_attributes_for(:seasons) }

	it { should be_valid }

	describe "when name is not present" do
		before { @player.name = " " }
		it { should_not be_valid }
	end

	describe "when position is not present" do
		before { @player.position = " " }
		it { should_not be_valid }
	end

	describe "when number is not present" do
		before { @player.number = " " }
		it { should_not be_valid }
	end

	describe "when gamesplayed is not present" do
		before { @player.gamesplayed = " " }
		it { should_not be_valid }
	end

	describe "when goals are not present" do
		before { @player.goals = " " }
		it { should_not be_valid }
	end

	describe "when assists are not present" do
		before { @player.assists = " " }
		it { should_not be_valid }
	end

	describe "when shorthandedgoals are not present" do
		before { @player.shorthandedgoals = " " }
		it { should_not be_valid }
	end

	describe "when powerplaygoals are not present" do
		before { @player.powerplaygoals = " " }
		it { should_not be_valid }
	end

	describe "when penalties are not present" do
		before { @player.penalties = " " }
		it { should_not be_valid }
	end
end
