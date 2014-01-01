# == Schema Information
#
# Table name: games
#
#  id                      :integer          not null, primary key
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  location                :string(255)
#  opponent                :string(255)
#  official                :boolean
#  time                    :time
#  date                    :date
#  scrimmage               :boolean
#  practice                :boolean
#  moose_goals             :integer
#  opponent_goals          :integer
#  moose_assists           :integer
#  opponent_assists        :integer
#  moose_shg               :integer
#  opponent_shg            :integer
#  moose_ppg               :integer
#  opponent_ppg            :integer
#  moose_penalties         :integer
#  opponent_penalties      :integer
#  opponents_shots_on_goal :integer
#  moose_shots_on_goal     :integer
#

require 'spec_helper'

describe Game do

	let(:season) { FactoryGirl.create(:season) }
	before do
	  @game = season.games.build(location: "Breck", 
	  				   opponent: "Ice Dog", 
	  				   time: "18:00",
	  				   date: "2012-12-12", 
	  				   official: true,
	  				   scrimmage: false,
	  				   practice: false,
	  				   moose_goals: 10,
	  				   opponent_goals: 5,
	  				   moose_assists: 12,
	  				   opponent_assists: 10,
	  				   moose_shg: 1,
	  				   opponent_shg: 0,
	  				   moose_ppg: 2,
	  				   opponent_ppg: 1,
	  				   moose_penalties: 4,
	  				   opponent_penalties: 10,
	  				   moose_shots_on_goal: 50,
	  				   opponent_shots_on_goal: 25)
	end
  
 	subject { @game }

 	it { should respond_to(:location) }
 	it { should respond_to(:opponent) }
 	it { should respond_to(:time) }
 	it { should respond_to(:date) }
 	it { should respond_to(:official) }
 	it { should respond_to(:scrimmage) }
 	it { should respond_to(:practice) }
 	it { should respond_to(:moose_goals) }
 	it { should respond_to(:opponent_goals) }
 	it { should respond_to(:moose_assists) }
 	it { should respond_to(:opponent_assists) }
 	it { should respond_to(:moose_shg) }
 	it { should respond_to(:opponent_shg) }
 	it { should respond_to(:moose_ppg) }
 	it { should respond_to(:opponent_ppg) }
 	it { should respond_to(:moose_penalties) }
 	it { should respond_to(:opponent_penalties) }
 	it { should respond_to(:moose_shots_on_goal) }
 	it { should respond_to(:opponent_shots_on_goal) }
 	it { should respond_to(:season_id) }
 	it { should respond_to(:season) }
 	its(:season) { should == season }
 	it { should belong_to(:season) }
 	it { should have_many(:memberships) }
 	it { should have_many(:players).through(:memberships) }
 	it { should accept_nested_attributes_for(:players) }

 	it { should be_valid }

 	describe "when date is not set" do
 		before { @game.date = " " }
 		it { should_not be_valid }
 	end

 	describe "when season id is not present" do
 		before { @game.season_id = nil }
 		it { should_not be_valid }
 	end

 	# Possible test to protect against mass-assignment vulnerabilities.
 	# Not sure if necessary or not. CURRENTLY NOT IMPLEMENTED.
 	#
 	# describe "accessible attributes" do
 	# 	it "should not allow access to season_id" do
 	# 		expect do
 	# 			Game.new(season_id: season.id)
 	# 		end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
 	# 	end
 	# end
end