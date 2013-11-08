require 'spec_helper'

describe "Team pages" do

	subject { page }

	describe "new team page" do
		before { visit new_team_path }

		# Unfortunately I have bad naming.  The model is team, but it is really 
		#creating a season.  However, the season might just be a tournament.  
		# Just going to go with team.
		it { should have_selector('h1', text: 'New Team Creation') }
		it { should have_selector('title', text: full_title('New Team')) }
	end

	describe "create new team" do
		
		before { visit new_team_path }

		let(:submit) { "Create Team" }

		describe "with invalid information" do
			it "should not create a team" do
				expect { click_button submit }.not_to change(Team, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_selector('title', text: "New Team") }
				it { should have_selector('div.alert.alert-error') }
			end
		end
		
		# Need to find a way to test this as simple form uses a calendar selector
		describe "with valid information" do
			before do
				fill_in "Name", 			with: "AHA 2012 Season"
			end

			it "should create a team" do
				expect { click_button submit }.to change(Team, :count).by(1)
			end

			describe "after saving the team" do
				before { click_button submit }
				let(:team) { Team.find_by_name('AHA 2012 Season') }

				it { should have_selector('title', text: "#{team.name}") }
				it { should have_selector('div.alert.alert-success', text: 'New team created') }
			end
		end
	end

	describe "team show page" do
		let(:team) { FactoryGirl.create(:team) }
		before { visit team_path(team) }

		it { should have_selector('h1',    text: "#{team.name}") }
		it { should have_selector('title', text: "#{team.name}") }
	end

	describe "edit team" do
		let(:team) { FactoryGirl.create(:team) }
		before { visit edit_team_path(team) }

		describe "edit team page" do
			it { should have_selector('h1',   text: "Update #{team.name}") }
			it { should have_selector('title', text: "Edit #{team.name}") }
		end

		describe "with invalid information" do
			let(:submit) { "Update Team" }
			before do
				fill_in "Name", with: " "
				click_button submit
			end

			it { should have_selector('div.alert.alert-error') }
		end

		# Need to find a way to test this as simple form uses a calendar selector
		describe "with valid information" do
			let(:submit) { "Update Team" }
			let(:new_name) { "New" }

			before do
				fill_in "Name", 			with: new_name
				click_button submit
			end

			it { should have_selector('title', text: "#{new_name}") }
			it { should have_selector('div.alert.alert-success') }
			specify { team.reload.name.should == new_name }
		end
	end
end
