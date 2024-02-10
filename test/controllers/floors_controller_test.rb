require "test_helper"

class FloorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @floor1 = floors(:one)
    @floor2 = floors(:two)
    @floor3 = floors(:three)
    @floor4 = floors(:four)
  end

  test "should get index" do
    get floors_url, as: :json
    assert_response :success
  end

  test "should create floor" do
    assert_difference("Floor.count") do
      post floors_url, params: { floor: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show floor 1" do
    get floor_url(@floor1), as: :json
    assert_response :success
  end

  test "should show floor 2" do
    get floor_url(@floor2), as: :json
    assert_response :success
  end

  test "should show floor 3" do
    get floor_url(@floor3), as: :json
    assert_response :success
  end

  test "should show floor 4" do
    get floor_url(@floor4), as: :json
    assert_response :success
  end

    assert_response :no_content
  end
end
