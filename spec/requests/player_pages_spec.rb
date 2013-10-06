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
				fill_in "First Name", 	with: "Example"
				fill_in "Last Name",  	with: "Player"
				fill_in "Number",     	with: 00
				fill_in "Position",		with: "Right Wing"
				fill_in "Games Played", with: 18
				fill_in "Goals",	  	with: 15
				fill_in "Assists",	  	with: 10
				fill_in "SHG", 		  	with: 1
				fill_in "PPG",		  	with: 3
				fill_in "PIM", 		  	with: 12
			end

			it "should create a player" do
				expect { click_button submit }.to change(Player, :count).by(1)
			end

			describe "after saving the player" do
				before { click_button submit }
				let(:player) { Player.find_by_firstname('Example') }

				it { should have_selector('title', text: "#{player.firstname} #{player.lastname}") }
				it { should have_selector('div.alert.alert-success', text: 'New player created') }
			end
		end
	end

	describe "player show page" do
		let(:player) { FactoryGirl.create(:player) }
		before { visit player_path(player) }

		it { should have_selector('h1',    text: "#{player.firstname} #{player.lastname}") }
		it { should have_selector('title', text: "#{player.firstname} #{player.lastname}") }
	end

	describe "edit player" do
		let(:player) { FactoryGirl.create(:player) }
		before { visit edit_player_path(player) }

		describe "edit player page" do
			it { should have_selector('h1',    text: "Update #{player.firstname} #{player.lastname} stats") }
			it { should have_selector('title', text: "edit #{player.firstname} #{player.lastname}") }
		end

		describe "with invalid information" do
			let(:submit) { "Update Player" }
			before do
				fill_in "First Name", 	with: " "
				fill_in "Last Name",  	with: " "
				fill_in "Number",     	with: " "
				fill_in "Position",		with: " "
				fill_in "Games Played", with: " "
				fill_in "Goals",	  	with: " "
				fill_in "Assists",	  	with: " "
				fill_in "SHG", 		  	with: " "
				fill_in "PPG",		  	with: " "
				fill_in "PIM", 		  	with: " "
				click_button submit
			end

			it { should have_selector('div.alert.alert-error') }
		end

		describe "with valid information" do
			let(:new_firstname) { "New" }
			let(:new_lastname) { "Name" }
			let(:new_position) { "New Position" }
			let(:new_number) { 100 }
			before do
				fill_in "First Name", 	with: new_firstname
				fill_in "Last Name",  	with: new_lastname
				fill_in "Number",     	with: new_number
				fill_in "Position",		with: new_position
				click_button "Update Player"
			end

			it { should have_selector('title', text: "#{new_firstname} #{new_lastname}") }
			it { should have_selector('div.alert.alert-success') }
			specify { player.reload.firstname.should == new_firstname}
			specify { player.reload.lastname.should == new_lastname}
			specify { player.reload.number.should == new_number}
			specify { player.reload.position.should == new_position}
		end
	end
end
