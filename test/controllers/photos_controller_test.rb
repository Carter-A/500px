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

  test "should be 100 like buttons" do
    get :index
    assert_select 'a.like-overlay', 100
  end

  test "should get show" do
    get(:show, {'id' => "139029315"}, {'user_id' => 1})
    assert_select 'img', 1
  end

end
