require 'test_helper'

class Admins::LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_labels_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_labels_edit_url
    assert_response :success
  end

end
