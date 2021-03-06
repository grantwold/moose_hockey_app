require 'spec_helper'

describe "Static Pages" do
	
	subject { page }

	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_selector('title',  text: full_title(page_title)) }
	end

	describe "Home page" do
		before { visit root_path }
		let(:heading)    { 'Moose Hockey' }
		let(:page_title) { '' }

		it_should_behave_like "all static pages"

		it { should_not have_selector 'title', text: '| Home' }
	end

	describe "Calendar page" do
		before { visit calendar_path }
		let(:heading) { 'Calendar' }
		let(:page_title) { 'Calendar' }

		it_should_behave_like "all static pages"
	end

	describe "Roster page" do
		before { visit roster_path }
		let(:heading) { 'Roster' }
		let(:page_title) { 'Roster' }

		it_should_behave_like "all static pages"
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "Calendar"
		page.should have_selector 'title', text: full_title('Calendar')
		click_link "Roster"
		page.should have_selector 'title', text: full_title('Roster')
		click_link "Moose Hockey"
		page.should have_selector 'title', text: full_title( '' )
	end
end
