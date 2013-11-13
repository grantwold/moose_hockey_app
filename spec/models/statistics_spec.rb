# == Schema Information
#
# Table name: statistics
#
#  id               :integer          not null, primary key
#  goals            :integer
#  assists          :integer
#  shorthandedgoals :integer
#  powerplaygoals   :integer
#  penalties        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  games_id         :integer
#

require 'spec_helper'

describe Statistics do
  
	let(:statistics) { FactoryGirl.create(:statistics) }
	before do
		@statistics = Statistics.new(goals: 15,
									 assists: 10,
									 shorthandedgoals: 1,
									 powerplaygoals: 3,
									 penalties: 12) 
	end

	subject { @statistics }

	it { should respond_to(:goals) }
	it { should respond_to(:assists) }
	it { should respond_to(:shorthandedgoals) }
	it { should respond_to(:powerplaygoals) }
	it { should respond_to(:penalties) }
	it { should belong_to(:games) }

	it { should be_valid }

	describe "when goals is not set" do
		before { @statistics.goals = " " }
		it { should_not be_valid }
	end

	describe "when assists is not set" do
		before { @statistics.assists = " " }
		it { should_not be_valid }
	end

	describe "when shorthandedgoals is not set" do
		before { @statistics.shorthandedgoals = " " }
		it { should_not be_valid }
	end

	describe "when powerplaygoals is not set" do
		before { @statistics.powerplaygoals = " " }
		it { should_not be_valid }
	end

	describe "when penalties is not set" do
		before { @statistics.penalties = " " }
		it { should_not be_valid }
	end
end
