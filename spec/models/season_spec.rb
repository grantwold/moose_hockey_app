# == Schema Information
#
# Table name: seasons
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  season_start   :date
#  season_end     :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  current_season :boolean          default(FALSE)
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
	it { should respond_to(:games) }
	it { should respond_to(:current_season) }
	it { should have_many(:memberships) }
	it { should have_many(:players).through(:memberships) }
	it { should have_many(:games) }
	it { should accept_nested_attributes_for(:players) }

	it { should be_valid }
	it { should_not be_current_season }

	describe "when name is not present" do
		before { @season.name = " " }
		it { should_not be_valid }
	end

	describe "with current_season attribute set to 'true'" do
		before { @season.toggle!(:current_season) }

		it { should be_current_season }
	end

	# Possible bug where the object is not reloaded in memory
	# causing a game to be created under the wrong season.
	describe "when two seasons are set to current_season" do
		before do
			@season.toggle!(:current_season)
			@season.save
			@season1 = Season.new(name: "Name")
			@season1.toggle!(:current_season)
			@season1.save
		end

		specify { @season.reload.current_season.should == false }
	end
 	
	describe "game associations" do

		before { @season.save }
		let!(:sample_game) do
			FactoryGirl.create(:game, season: @season)
		end
		let!(:sample_game2) do
			FactoryGirl.create(:game, season: @season)
		end

		it "should destroy associated games" do
			games = @season.games
			@season.destroy
			games.each do |game|
				Game.find_by_id(game.id).should be_nil
			end
		end
	end
end


