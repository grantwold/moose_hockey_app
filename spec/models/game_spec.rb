# == Schema Information
#
# Table name: games
#
#  id               :integer          not null, primary key
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
#  season_id        :integer
#

require 'spec_helper'

describe Game do

	before do
	  @game = Game.new(location: "Breck", 
	  				   opponent: "Ice Dog", 
	  				   time: "18:00",
	  				   date: "2012-12-12", 
	  				   official: true,
	  				   scrimmage: false,
	  				   practice: false,
	  				   goals: 10,
	  				   assists: 12,
	  				   shorthandedgoals: 1,
	  				   powerplaygoals: 2,
	  				   penalties: 4)
	end
  
 	subject { @game }

 	it { should respond_to(:location) }
 	it { should respond_to(:opponent) }
 	it { should respond_to(:time) }
 	it { should respond_to(:date) }
 	it { should respond_to(:official) }
 	it { should respond_to(:scrimmage) }
 	it { should respond_to(:practice) }
 	it { should respond_to(:goals) }
 	it { should respond_to(:assists) }
 	it { should respond_to(:shorthandedgoals) }
 	it { should respond_to(:powerplaygoals) }
 	it { should respond_to(:penalties) }
 	it { should have_and_belong_to_many(:seasons) }
 	it { should have_many(:memberships) }
 	it { should have_many(:players).through(:memberships) }
 	it { should accept_nested_attributes_for(:players) }
 	it { should accept_nested_attributes_for(:seasons) }

 	it { should be_valid }

 	describe "when date is not set" do
 		before { @game.date = " " }
 		it { should_not be_valid }
 	end
end
