# frozen_string_literal: true

require 'test_helper'

class SpaceControllerTest < ActionDispatch::IntegrationTest
  setup do
    @Space1 = space(:one)
    @Space2 = space(:two)
  end

  test 'should create space' do
    post spaces_path, params: { spaces_name: 'Room', floor_id: 1, max_occupancy: 1, description: 'Description' },
                      as: :json

    assert_response :created
  end

  # write GET requests

  test "should get single space" do
    get user_url(@Space1), as: :json
    assert_response :success
  end

  test "should get single space" do
    get user_url(@Space2), as: :json
    assert_response :success
  end

end
