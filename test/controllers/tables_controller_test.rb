require 'test_helper'

class TablesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @table = tables(:one)
  end

  test "should get index" do
    get tables_url
    assert_response :success
  end

  test "should get new" do
    get new_table_url
    assert_response :success
  end

  test "should create table" do
    assert_difference('Table.count') do
      post tables_url, params: { table: { reference: @table.reference, status: @table.status } }
    end

    assert_redirected_to table_url(Table.last)
  end

  test "should show table" do
    get table_url(@table)
    assert_response :success
  end

  test "should get edit" do
    get edit_table_url(@table)
    assert_response :success
  end

  test "should update table" do
    patch table_url(@table), params: { table: { reference: @table.reference, status: @table.status } }
    assert_redirected_to table_url(@table)
  end

  test "should destroy table" do
    assert_difference('Table.count', -1) do
      delete table_url(@table)
    end

    assert_redirected_to tables_url
  end
end
