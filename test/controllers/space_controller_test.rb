require 'test_helper'

class SpaceControllerTest < ActionDispatch::IntegrationTest
  setup do
    @Space1 = space(:one)
  end

  test 'should create space' do
    post spaces_path, params: { spaces_name: 'Room', floor_id: 1, max_occupancy: 1, description: "Description"}, as: :json

    assert_response :created
  end
end
