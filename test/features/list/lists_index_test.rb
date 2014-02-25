require "test_helper"

feature "Viewing lists page" do
  scenario "should be visible from homepage" do
    visit "/"
    page.text.must_include lists(:one).title
  end

  scenario "should be visible from lists index" do
    visit lists_path
    page.text.must_include lists(:one).title
  end
end
