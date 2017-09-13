require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Favorite things list', {:type => :feature}) do
  it "adds an item to the list" do
    visit('/')
    fill_in('name', :with => "cats")
    fill_in('ranking', :with => 6)
    click_button('Go!')
    expect(page).to have_content("cats")
  end
  it('Clicked items link to the item page') do
    visit('/')
    fill_in('name', :with => "tacos")
    fill_in('ranking', :with =>"4")
    click_button('Go!')
    click_link('tacos')
    expect(page).to have_content("tacos")
    expect(page).to have_content("Back to list")
  end
  it('Prints lists sorted by ranking') do
    visit('/')
    fill_in('name', :with =>"pizza")
    fill_in('ranking', :with =>"1")
    click_button('Go!')
    fill_in('name', :with =>"curry")
    fill_in('ranking', :with =>"2")
    click_button('Go!')
    expect(page.find('.favorite-things p:nth-child(1)')).to have_content 'pizza'
    expect(page.find('.favorite-things p:nth-child(2)')).to have_content 'curry'
    expect(page.find('.favorite-things p:nth-child(3)')).to have_content 'tacos'
  end
end
