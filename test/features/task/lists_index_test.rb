require "test_helper"

feature "Viewing a list page" do
  scenario "should have tasks" do
    visit list_path(lists(:one))
    page.text.must_include tasks(:one).task
  end
end
