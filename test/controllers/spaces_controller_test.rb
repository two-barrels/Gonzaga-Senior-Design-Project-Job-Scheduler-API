require 'test_helper'

class SpacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @space = space(:one)
  end

  test 'should create space' do
    post spaces_path, params: { spaces_name: 'Room', floor_id: 1, max_occupancy: 1, description: 'Description' },
                      as: :json

    assert_response :created
  end

  test 'should get index' do
    get spaces_url, as: :json
    assert_response :success
  end

  test 'should show space' do
    get space_url(@space), as: :json
    assert_response :success
  end

  test 'should update space' do
    patch space_url(@space), params: { space: {} }, as: :json
    assert_response :success
  end

  test 'should destroy space' do
    assert_difference('Space.count', -1) do
      delete space_url(@space), as: :json
    end

    assert_response :no_content
  end
end
