# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
#  player_id        :integer
#  season_id        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  location         :string(255)
#  opponent         :string(255)
#  official         :boolean
#  time             :time
#  date             :date
#  goals            :integer
#  assists          :integer
#  shorthandedgoals :integer
#  powerplaygoals   :integer
#  penalties        :integer
#  scrimmage        :boolean
#  practice         :boolean
#

require 'spec_helper'

describe Game do

	before do
	  @game = Game.new(location: "Breck", 
	  				   opponent: "Ice Dog", 
	  				   time: "18:00",
	  				   date: "2012-12-12", 
	  				   official: true)
	end
  
 	subject { @game }

 	it { should respond_to(:location) }
 	it { should respond_to(:opponent) }
 	it { should respond_to(:time) }
 	it { should respond_to(:date) }
 	it { should respond_to(:official) }
 	it { should respond_to(:player_id) }
 	it { should respond_to(:season_id) }
 	it { should belong_to(:player) }
 	it { should belong_to(:season) }

 	it { should be_valid }

 	describe "when date is not set" do
 		before { @game.date = " " }
 		it { should_not be_valid }
 	end
end
