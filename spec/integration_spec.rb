require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("The music path", {:type => :feature}) do

  it("visits the bands page") do
    visit('/')
    click_link('Add a new band')
    expect(page).to have_content("band Portal")
  end

  it("adds a new band") do
    visit('/bands')
    fill_in("name", :with => "John")
    click_button('Add band')
    expect(page).to have_content("John")
  end

  it("adds a new venue") do
    visit('/venues')
    fill_in('name', :with => "Sally")
    click_button('Add venue')
    expect(page).to have_content("Sally")
  end

  it("add a band to a venue") do
    visit('/bands')
    fill_in('name', :with => "Bob")
    click_button('Add band')
    visit('/venues')
    click_button('Add bands')
    expect(page).to have_content("Bob")
  end

  it("deletes a band") do
    visit('/bands')
    fill_in('name', :with => "Bob")
    click_button('Add band')
    click_link("Bob")
    click_button("Delete band")
    expect(page).to have_content("band Portal")
  end

  it("deletes a venue") do
    visit('/venues')
    fill_in('name', :with => "Bob")
    click_button('Add venue')
    click_link("Bob")
    click_button("Remove venue")
    expect(page).to have_content("venue Portal")
  end

end
