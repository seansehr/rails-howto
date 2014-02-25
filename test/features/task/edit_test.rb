require "test_helper"

feature "Editing a task" do
  scenario "submit form data to edit a task" do
    visit edit_list_task_path(lists(:one), tasks(:one))
    fill_in "Task", with: tasks(:two).task
    click_on "Update Task"
    page.text.must_include "Task was successfully updated."
  end
end
