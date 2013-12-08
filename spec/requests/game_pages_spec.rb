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
	end
end
