# == Schema Information
#
# Table name: players
#
#  id               :integer          not null, primary key
#  firstname        :string(255)
#  lastname         :string(255)
#  number           :integer
#  gamesplayed      :integer
#  goals            :integer
#  assists          :integer
#  shorthandedgoals :integer
#  powerplaygoals   :integer
#  penalties        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe Player do

	before do
		@player = Player.new(firstname: "Example", 
							 lastname: "Player", 
							 number: 00, 
							 gamesplayed: 18,
							 goals: 15,
							 assists: 10,
							 shorthandedgoals: 1,
							 powerplaygoals: 3,
							 penalties: 12,)
	end

	subject { @player }

	it { should respond_to(:firstname) }
	it { should respond_to(:lastname) }
	it { should respond_to(:number) }
	it { should respond_to(:gamesplayed) }
	it { should respond_to(:goals) }
	it { should respond_to(:assists) }
	it { should respond_to(:shorthandedgoals) }
	it { should respond_to(:powerplaygoals) }
	it { should respond_to(:penalties) }

	it { should be_valid }

	describe "when firstname is not present" do
		before { @player.firstname = " " }
		it { should_not be_valid }
	end

	describe "when lastname is not present" do
		before { @player.lastname = " " }
		it { should_not be_valid }
	end
end
