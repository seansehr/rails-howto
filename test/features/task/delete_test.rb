require "test_helper"

feature "Deleting a task" do
  scenario "submit form data to delete a task" do
    list = lists(:one)
    visit list_path(list)
    task = tasks(:one)
    
    find("a[href='#{list_task_path(list, task)}'][data-method='delete']").click
    page.text.must_include "#{task.task} was successfully destroyed."
  end
end
