require "application_system_test_case"

class TablesTest < ApplicationSystemTestCase
  setup do
    @table = tables(:one)
  end

  test "visiting the index" do
    visit tables_url
    assert_selector "h1", text: "Tables"
  end

  test "creating a Table" do
    visit tables_url
    click_on "New Table"

    fill_in "Reference", with: @table.reference
    fill_in "Status", with: @table.status
    click_on "Create Table"

    assert_text "Table was successfully created"
    click_on "Back"
  end

  test "updating a Table" do
    visit tables_url
    click_on "Edit", match: :first

    fill_in "Reference", with: @table.reference
    fill_in "Status", with: @table.status
    click_on "Update Table"

    assert_text "Table was successfully updated"
    click_on "Back"
  end

  test "destroying a Table" do
    visit tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Table was successfully destroyed"
  end
end
