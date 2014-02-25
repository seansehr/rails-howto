require "test_helper"

feature "Deleting a list" do
  scenario "submit form data to delete a list" do
    visit lists_path
    list = lists(:one)
    
    find("a[href='#{list_path(list)}'][data-method='delete']").click
    page.text.must_include "#{list.title} was successfully destroyed."
  end
end
