require 'spec_helper'

describe "Game Pages" do

	subject { page }

	describe "new game page" do
		before { visit new_game_path }

		it { should have_selector('h1', text: 'Create a new game') }
		it { should have_selector('title', text: full_title("New Game")) }
	end

	describe "create new game" do

		before { visit new_game_path }

		let(:submit) { "Create Game" }

		describe "with invalid information" do
			it "should not create a game" do
				expect { click_button submit }.not_to change(Game, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_selector('title', text: "New Game") }
				it { should have_selector('div.alert.alert-error') }
			end
		end

		describe "with valid information" do
			let!(:season) { FactoryGirl.create(:season) }
			let(:submit) { "Create Game" }
			before do
				visit new_game_path
				fill_in "Date", with: "01/22/2014"
				select season.name, :from => 'Season'
			end

			it "should create a game" do
				expect { click_button submit }.to change(Game, :count).by(1)
			end

			describe "after saving the game" do
				before { click_button submit }
				let(:game) { Game.find_by_date('2014-01-22') }

				it { should have_selector('title', text: "#{game.date}") }
				it { should have_selector('div.alert.alert-success', text: 'New game created') }
			end
		end
	end
end
