require 'spec_helper'

describe "Season pages" do

	subject { page }

	describe "new season page" do
		before { visit new_season_path }

		it { should have_selector('h1', text: 'New Season Creation') }
		it { should have_selector('title', text: full_title('New Season')) }
	end

	describe "create new season" do
		
		before { visit new_season_path }

		let(:submit) { "Create Season" }

		describe "with invalid information" do
			it "should not create a season" do
				expect { click_button submit }.not_to change(Season, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_selector('title', text: "New Season") }
				it { should have_selector('div.alert.alert-error') }
			end
		end
		
		describe "with valid information" do
			before do
				fill_in "Name", 			with: "AHA 2012 Season"
				fill_in "Start of season",  with: "12/08/2013"
				fill_in "End of season",	with: "12/08/2013"
			end

			it "should create a season" do
				expect { click_button submit }.to change(Season, :count).by(1)
			end

			describe "after saving the season" do
				before { click_button submit }
				let(:season) { Season.find_by_name('AHA 2012 Season') }

				it { should have_selector('title', text: "#{season.name}") }
				it { should have_selector('div.alert.alert-success', text: 'New Season Created') }
			end
		end
	end

	describe "season show page" do
		let(:season) { FactoryGirl.create(:season) }
		before { visit season_path(season) }

		it { should have_selector('h1',    text: "#{season.name}") }
		it { should have_selector('title', text: "#{season.name}") }
	end

	describe "edit season" do
		let(:season) { FactoryGirl.create(:season) }
		before { visit edit_season_path(season) }

		describe "edit season page" do
			it { should have_selector('h1',   text: "Update #{season.name}") }
			it { should have_selector('title', text: "Edit #{season.name}") }
		end

		describe "with invalid information" do
			let(:submit) { "Update Season" }
			before do
				fill_in "Name", with: " "
				click_button submit
			end

			it { should have_selector('div.alert.alert-error') }
		end

		# Need to find a way to test this as simple form uses a calendar selector
		describe "with valid information" do
			let(:submit) { "Update Season" }
			let(:new_name) { "New" }

			before do
				fill_in "Name", with: new_name
				click_button submit
			end

			it { should have_selector('title', text: "#{new_name}") }
			it { should have_selector('div.alert.alert-success') }
			specify { season.reload.name.should == new_name }
		end
	end
end
