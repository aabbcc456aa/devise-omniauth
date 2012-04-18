require 'test_helper'

class OmniauthMessagesControllerTest < ActionController::TestCase
  setup do
    @omniauth_message = omniauth_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omniauth_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omniauth_message" do
    assert_difference('OmniauthMessage.count') do
      post :create, omniauth_message: @omniauth_message.attributes
    end

    assert_redirected_to omniauth_message_path(assigns(:omniauth_message))
  end

  test "should show omniauth_message" do
    get :show, id: @omniauth_message.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omniauth_message.to_param
    assert_response :success
  end

  test "should update omniauth_message" do
    put :update, id: @omniauth_message.to_param, omniauth_message: @omniauth_message.attributes
    assert_redirected_to omniauth_message_path(assigns(:omniauth_message))
  end

  test "should destroy omniauth_message" do
    assert_difference('OmniauthMessage.count', -1) do
      delete :destroy, id: @omniauth_message.to_param
    end

    assert_redirected_to omniauth_messages_path
  end
end
