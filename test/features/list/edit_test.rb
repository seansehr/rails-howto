require "test_helper"

feature "Editing a list" do
  scenario "submit form data to edit a list" do
    visit edit_list_path(lists(:one))
    fill_in "Title", with: lists(:two).title
    click_on "Update List"
    page.text.must_include "List was successfully updated."
  end
end
