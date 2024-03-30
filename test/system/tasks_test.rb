require "application_system_test_case"

class TasksTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit tasks_url
  #
  #   assert_selector "h1", text: "Tasks"
  # end
  setup do
    @task = tasks(:first) # Reference to the first fixture quote
  end

  test "Creating a new task" do
    # When we visit the Quotes#index page
    # we expect to see a title with the text "Quotes"
    visit tasks_path
    assert_selector "h1", text: "tasks"

    # When we click on the link with the text "New quote"
    # we expect to land on a page with the title "New quote"
    click_on "New task"
    assert_selector "h1", text: "New task"

    # When we fill in the name input with "Capybara task"
    # and we click on "Create Quote"
    fill_in "Name", with: "Capybara task"
    click_on "Create task"

    # We expect to be back on the page with the title "Quotes"
    # and to see our "Capybara quote" added to the list
    assert_selector "h1", text: "tasks"
    assert_text "Capybara tasks"
  end

  test "Showing a task" do
    visit tasks_path
    click_link @task.name

    assert_selector "h1", text: task.name
  end

  test "Updating a task" do
    visit quotes_path
    assert_selector "h1", text: "tasks"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit task"

    fill_in "task", with: "Updated task"
    click_on "Update task"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated task"
  end

  test "Destroying a task" do
    visit quotes_path
    assert_text @task.name

    click_on "Delete", match: :first
    assert_no_text @task.name
  end
end
