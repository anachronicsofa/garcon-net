require 'test_helper'

class CommandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @command = commands(:one)
  end

  test "should get index" do
    get commands_url
    assert_response :success
  end

  test "should get new" do
    get new_command_url
    assert_response :success
  end

  test "should create command" do
    assert_difference('Command.count') do
      post commands_url, params: { command: { client_cpf: @command.client_cpf, client_email: @command.client_email, client_name: @command.client_name, payment_status: @command.payment_status, total: @command.total } }
    end

    assert_redirected_to command_url(Command.last)
  end

  test "should show command" do
    get command_url(@command)
    assert_response :success
  end

  test "should get edit" do
    get edit_command_url(@command)
    assert_response :success
  end

  test "should update command" do
    patch command_url(@command), params: { command: { client_cpf: @command.client_cpf, client_email: @command.client_email, client_name: @command.client_name, payment_status: @command.payment_status, total: @command.total } }
    assert_redirected_to command_url(@command)
  end

  test "should destroy command" do
    assert_difference('Command.count', -1) do
      delete command_url(@command)
    end

    assert_redirected_to commands_url
  end
end
