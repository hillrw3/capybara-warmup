require "spec_helper"

feature "Homepage" do
  before(:each) do
    visit "/"
  end

  scenario "should have a page header" do
    expect(page).to have_content("RSVP App")
  end

  scenario "should have rsvp button" do
    expect(page).to have_link("RSVP")
  end

  scenario "user fills in and submits form" do
    visit "/rsvps/new"
    fill_in "name", with: "Rob"
    fill_in "email", with: "rob@example.com"
    select "2", from: "number_of_guests"
    # select "Fish", from: "dinner_choice"
    choose("Fish")
    click_on "RSVP"
    expect(page).to have_content("Thanks for RSVPing!")
  end


end
