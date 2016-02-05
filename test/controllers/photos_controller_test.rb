require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photos)
  end

  test "should be 100 photos" do
    get :index
    assert_select 'div.img-container', 100
  end
end
