# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  number     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :string(255)
#  name       :string(255)
#

require 'spec_helper'

describe Player do

	before do
		@player = Player.new(name: "Example Player", 
							 number: 00,
							 position: "Right Wing")
	end

	subject { @player }

	it { should respond_to(:name) }
	it { should respond_to(:position) }
	it { should respond_to(:number) }
	it { should have_many(:memberships) }
	it { should have_many(:seasons).through(:memberships) }
	it { should have_many(:games).through(:memberships) }
	it { should accept_nested_attributes_for(:seasons) }

	it { should be_valid }

	describe "when name is not present" do
		before { @player.name = " " }
		it { should_not be_valid }
	end

	describe "when position is not present" do
		before { @player.position = " " }
		it { should_not be_valid }
	end

	describe "when number is not present" do
		before { @player.number = " " }
		it { should_not be_valid }
	end
end
