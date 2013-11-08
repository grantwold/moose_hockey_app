# == Schema Information
#
# Table name: seasons
#
#  id           :integer          not null, primary key
#  season_start :date
#  season_end   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string(255)
#

require 'spec_helper'

describe season do
  
  let(:player) { FactoryGirl.create(:player) }
  before do
    @season = season.new(season_start: "2012-10-27", 
                     season_end: "2013-4-15",
                     name: "AHA 2012 Season")
  end

  subject { @season }

  it { should respond_to(:name) }
  it { should respond_to(:season_start) }
  it { should respond_to(:season_end) }
  it { should have_and_belong_to_many(:players) }


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
