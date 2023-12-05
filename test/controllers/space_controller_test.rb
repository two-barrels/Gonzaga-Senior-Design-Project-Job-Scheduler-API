require 'test_helper'

class SpaceControllerTest < ActionDispatch::IntegrationTest
  setup do
    @Space1 = space(:one)
  end

  test 'should create space' do
    post spaces, params: { spaces_name: 'Room', floor_id: 1, max_occupancy: 1, description: "Description"}, as: :json

    assert_response :created
  end

  test 'should destroy space' do
    delete spaces, @Space1.id, as: :json

    assert_response :deleted
  end

end
