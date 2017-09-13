require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Favorite things list', {:type => :feature}) do
  it "adds an item to the list" do
    visit('/')
    fill_in('name', :with => "cats")
    click_button('Go!')
    expect(page).to have_content("cats")
  end
  it('Clicked items link to the item page') do
    visit('/')
    fill_in('name', :with => "tacos")
    click_button('Go!')
    click_link('tacos')
    expect(page).to have_content("tacos")
    expect(page).to have_content("Back to list")
  end
end
