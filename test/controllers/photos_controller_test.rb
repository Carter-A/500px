require 'test_helper'

class PhotosControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get :index
    assert_not_nil assigns(:photos)
  end

  test "title should be Fivehundredpixels" do
    get :index
    assert_select 'title', 'Fivehundredpixels'
  end

  test "should be 100 photos" do
    get :index
    assert_select 'div.img-container', 100
  end

  test "should be 34 rows" do
    get :index
    assert_select 'div.row', 34
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

  test "should have 1 h1" do
    get(:show, {'id' => "139029315"}, {'user_id' => 1})
    assert_select 'h1', 1
  end

  test "should have 2 h4" do
    get(:show, {'id' => "139029315"}, {'user_id' => 1})
    assert_select 'h4', 2
  end
end
