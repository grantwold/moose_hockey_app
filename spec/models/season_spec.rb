# == Schema Information
#
# Table name: seasons
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  season_start :date
#  season_end   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Season do

	let(:player) { FactoryGirl.create(:player) }
	before do
		@season = Season.new(season_start: "2012-10-27", 
	                 season_end: "2013-4-15",
	                 name: "AHA 2012 Season")
	end

	subject { @season }

	it { should respond_to(:name) }
	it { should respond_to(:season_start) }
	it { should respond_to(:season_end) }
	it { should have_many(:players).through(:games) }
	it { should accept_nested_attributes_for(:players) }


	it { should be_valid }

	describe "when season start is not set" do
		before { @season.season_start = " " }
		it { should_not be_valid }
	end

	describe "when season end is not set" do
		before { @season.season_end = " " }
		it { should_not be_valid }
	end
end


