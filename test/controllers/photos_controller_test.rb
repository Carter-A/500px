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

  test "should get show and have 1 image" do
    get(:show, {'id' => "139029315"}, {'user_id' => 1})
    assert_select 'img', 1
  end

  test "should have 1 like button" do
    get(:show, {'id' => "139029315"}, {'user_id' => 1})
    assert_select 'a.btn', 1
  end

end
