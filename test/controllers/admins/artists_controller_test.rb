require 'test_helper'

class Admins::ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_artists_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_artists_edit_url
    assert_response :success
  end

end
