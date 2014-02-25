require "test_helper"

feature "Creating a task" do
  scenario "submit form data to create a new task" do
    visit list_path(tasks(:one))
    fill_in "Task", with: tasks(:three).task
    click_on "Create Task"
    page.text.must_include "Task was successfully created."
  end
end
