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
#  games_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe Statistic do
  
	let(:statistic) { FactoryGirl.create(:statistic) }
	before do
		@statistic = Statistic.new(goals: 15,
									 assists: 10,
									 shorthandedgoals: 1,
									 powerplaygoals: 3,
									 penalties: 12) 
	end

	subject { @statistic }

	it { should respond_to(:goals) }
	it { should respond_to(:assists) }
	it { should respond_to(:shorthandedgoals) }
	it { should respond_to(:powerplaygoals) }
	it { should respond_to(:penalties) }
	it { should respond_to(:games_id) }
	it { should belong_to(:games) }

	it { should be_valid }

	describe "when goals is not set" do
		before { @statistic.goals = " " }
		it { should_not be_valid }
	end

	describe "when assists is not set" do
		before { @statistic.assists = " " }
		it { should_not be_valid }
	end

	describe "when shorthandedgoals is not set" do
		before { @statistic.shorthandedgoals = " " }
		it { should_not be_valid }
	end

	describe "when powerplaygoals is not set" do
		before { @statistic.powerplaygoals = " " }
		it { should_not be_valid }
	end

	describe "when penalties is not set" do
		before { @statistic.penalties = " " }
		it { should_not be_valid }
	end
end
