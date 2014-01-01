require 'spec_helper'

describe "Game Pages" do

	subject { page }

	let!(:current_season) { FactoryGirl.create(:current_season) }

	describe "new game page" do
		before { visit new_game_path }

		it { should have_selector('h1', text: 'Create a new game') }
		it { should have_selector('title', text: full_title("New Game")) }
	end

	describe "create new game" do
		before do
			visit new_game_path
		end

		describe "with invalid information" do
			it "should not create a game" do
				expect { click_button "Create Game" }.should_not change(Game, :count)
			end

			describe "after submission" do
				before { click_button "Create Game" }

				it { should have_selector('title', text: "New Game") }
				it { should have_selector('div.alert.alert-error') }
			end
		end

		describe "with valid information" do
			let!(:current_season) { FactoryGirl.create(:current_season) }

			before { fill_in "Date", with: "2014-01-12" }

			it "should create a game" do
				expect { click_button "Create Game" }.should change(Game, :count).by(1)
			end

			describe "after saving the game" do
				before { click_button "Create Game" }
				let(:game) { Game.find_by_date("2014-01-12") }

				it { should have_selector('title', text: "#{game.date}") }
				it { should have_selector('div.alert.alert-success', text: 'New game created') }
			end
		end
	end

	describe "edit game page" do
		let(:season) { FactoryGirl.create(:season) }
		let(:game) { FactoryGirl.create(:game, season: season) }
		before { visit edit_game_path(game) }

		describe "edit player page" do
			it { should have_selector('h1',    text: "Update game on #{game.date}") }
			it { should have_selector('title', text: "Edit #{game.date}") }
		end

		# Possibly need a test here for invalid information.
		# Currently simple_form fills the textbox with the games
		# date.  This makes putting an invalid date in difficult.
		describe "with valid information" do
			let(:new_date) { "2014-02-12" }

			before do
				fill_in "Date", with: new_date
				click_button "Update Game"
			end

			it { should have_selector('title', text: "#{new_date}") }
			it { should have_selector('div.alert.alert-success') }
			specify { game.reload.date.strftime("%Y-%m-%-d").should == new_date }
		end
	end
end
