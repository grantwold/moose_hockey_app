# == Schema Information
#
# Table name: teams
#
#  id           :integer          not null, primary key
#  season_start :date
#  season_end   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)
#

require 'spec_helper'

describe Team do
  
  let(:player) { FactoryGirl.create(:player) }
  before do
    @team = Team.new(season_start: "2012-10-27", 
                     season_end: "2013-4-15",
                     name: "AHA 2012 Season")
  end

  subject { @team }

  it { should respond_to(:name) }
  it { should respond_to(:season_start) }
  it { should respond_to(:season_end) }
  it { should have_and_belong_to_many(:players) }


  it { should be_valid }

  describe "when season start is not set" do
  	before { @team.season_start = " " }
  	it { should_not be_valid }
  end

  describe "when season end is not set" do
  	before { @team.season_end = " " }
  	it { should_not be_valid }
  end
end
