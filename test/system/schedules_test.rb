require "application_system_test_case"

class SchedulesTest < ApplicationSystemTestCase
  setup do
    @schedule = schedules(:one)
  end

  test "visiting the index" do
    visit schedules_url
    assert_selector "h1", text: "Schedules"
  end

  test "should create schedule" do
    visit schedules_url
    click_on "New schedule"

    fill_in "Destination", with: @schedule.destination
    fill_in "End date", with: @schedule.end_date
    fill_in "Planner", with: @schedule.planner_id
    fill_in "Start date", with: @schedule.start_date
    fill_in "User", with: @schedule.user_id
    click_on "Create Schedule"

    assert_text "Schedule was successfully created"
    click_on "Back"
  end

  test "should update Schedule" do
    visit schedule_url(@schedule)
    click_on "Edit this schedule", match: :first

    fill_in "Destination", with: @schedule.destination
    fill_in "End date", with: @schedule.end_date.to_s
    fill_in "Planner", with: @schedule.planner_id
    fill_in "Start date", with: @schedule.start_date.to_s
    fill_in "User", with: @schedule.user_id
    click_on "Update Schedule"

    assert_text "Schedule was successfully updated"
    click_on "Back"
  end

  test "should destroy Schedule" do
    visit schedule_url(@schedule)
    click_on "Destroy this schedule", match: :first

    assert_text "Schedule was successfully destroyed"
  end
end
