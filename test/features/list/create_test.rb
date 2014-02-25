require "test_helper"

feature "Creating a list" do
  scenario "submit form data to create a new list" do
    visit new_list_path
    fill_in "Title", with: lists(:one).title
    click_on "Create List"
    page.text.must_include "List was successfully created."
  end
end
