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

	describe "when name is not present" do
		before { @season.name = " " }
		it { should_not be_valid }
	end
end


