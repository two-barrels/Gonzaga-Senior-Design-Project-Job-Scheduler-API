require 'test_helper'

class SpaceControllerTest < ActionDispatch::IntegrationTest
  setup do
    @Spaces = space(:one)
  end

  test 'should create space' do
    assert_difference('Space.count') do
        post spaces, params: { spaces_name: 'Room', floor_id: 1, max_occupancy: 1, description: "Description"}, as: :json
    end

    assert_response :created
  end

  test 'should destroy post' do
    assert_difference('Space.count', -1) do
      delete spaces(Spaces.first), as: :json
    end

    assert_response :no_content
  end

end
