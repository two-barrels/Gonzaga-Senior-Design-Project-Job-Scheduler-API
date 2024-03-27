# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should show user' do
    get user_url(@user), as: :json
    assert_response :success
  end

  test 'should update user' do
    patch user_url(@user), params: { user: @user }, as: :json
    assert_response :success
  end

  test 'should destroy user' do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end
