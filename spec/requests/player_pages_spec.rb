require 'spec_helper'

describe "Player pages" do

	subject { page }

	describe "new player page" do
		before { visit new_player_path }

		it { should have_selector('h1', text: 'New Player Creation') }
		it { should have_selector('title', text: full_title('New Player')) }
	end

	describe "create new player" do
		
		before { visit new_player_path }

		let(:submit) { "Create Player" }

		describe "with invalid information" do
			it "should not create a player" do
				expect { click_button submit }.not_to change(Player, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_selector('title', text: "New Player") }
				it { should have_selector('div.alert.alert-error') }
			end
		end

		describe "with valid information" do
			before do
				fill_in "Name", 		with: "Example Player"
				fill_in "Number",     	with: 00
				fill_in "Position",		with: "Right Wing"
			end

			it "should create a player" do
				expect { click_button submit }.to change(Player, :count).by(1)
			end

			describe "after saving the player" do
				before { click_button submit }
				let(:player) { Player.find_by_name('Example Player') }

				it { should have_selector('title', text: "#{player.name}") }
				it { should have_selector('div.alert.alert-success', text: 'New player created') }
			end
		end
	end

	describe "player show page" do
		let(:player) { FactoryGirl.create(:player) }
		before { visit player_path(player) }

		it { should have_selector('h1',    text: "#{player.name}") }
		it { should have_selector('title', text: "#{player.name}") }
	end

	describe "edit player" do
		let(:player) { FactoryGirl.create(:player) }
		before { visit edit_player_path(player) }

		describe "edit player page" do
			it { should have_selector('h1',    text: "Update #{player.name}") }
			it { should have_selector('title', text: "Edit #{player.name}") }
		end

		describe "with invalid information" do
			let(:submit) { "Update Player" }
			before do
				fill_in "Name",			with: " "
				fill_in "Number",     	with: " "
				fill_in "Position",		with: " "
				click_button submit
			end

			it { should have_selector('div.alert.alert-error') }
		end

		describe "with valid information" do
			let(:new_name) { "New Name" }
			let(:new_position) { "New Position" }
			let(:new_number) { 100 }
			before do
				fill_in "Name", 		with: new_name
				fill_in "Number",     	with: new_number
				fill_in "Position",		with: new_position
				click_button "Update Player"
			end

			it { should have_selector('title', text: "#{new_name}") }
			it { should have_selector('div.alert.alert-success') }
			specify { player.reload.name.should == new_name }
			specify { player.reload.number.should == new_number }
			specify { player.reload.position.should == new_position }
		end
	end
end
