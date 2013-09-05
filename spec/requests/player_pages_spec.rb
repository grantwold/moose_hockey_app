require 'spec_helper'

describe "Player pages" do

	subject { page }

	describe "new player page" do
		before { visit newplayer_path }

		it { should have_selector('h1', text: 'New Player Creation') }
		it { should have_selector('title', text: full_title('New Player')) }
	end

	describe "create new player" do
		
		before { visit newplayer_path }

		let(:submit) { "Create New Player" }

		describe "with invalid information" do
			it "should not create a player" do
				expect { click_button submit }.not_to change(Player, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "First Name",      		with: "Example"
				fill_in "Last Name",       		with: "Player"
				fill_in "Number",         	 	with: 00
				fill_in "Games Played",    		with: 18
				fill_in "Goals",		   		with: 15
				fill_in "Assists",		   		with: 10
				fill_in "SHG", 	with: 1
				fill_in "PPG",		with: 3
				fill_in "PIM", with: 12
			end

			it "should create a player" do
				expect { click_button submit }.to change(Player, :count).by(1)
			end
		end
	end
end
