require 'test_helper'

class QuestionsetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @questionset = questionsets(:one)
  end

  test "should get index" do
    get questionsets_url
    assert_response :success
  end

  test "should get new" do
    get new_questionset_url
    assert_response :success
  end

  test "should create questionset" do
    assert_difference('Questionset.count') do
      post questionsets_url, params: { questionset: { Genre_id: @questionset.Genre_id, Subgenre_id: @questionset.Subgenre_id, User_id: @questionset.User_id, number_correct: @questionset.number_correct } }
    end

    assert_redirected_to questionset_url(Questionset.last)
  end

  test "should show questionset" do
    get questionset_url(@questionset)
    assert_response :success
  end

  test "should get edit" do
    get edit_questionset_url(@questionset)
    assert_response :success
  end

  test "should update questionset" do
    patch questionset_url(@questionset), params: { questionset: { Genre_id: @questionset.Genre_id, Subgenre_id: @questionset.Subgenre_id, User_id: @questionset.User_id, number_correct: @questionset.number_correct } }
    assert_redirected_to questionset_url(@questionset)
  end

  test "should destroy questionset" do
    assert_difference('Questionset.count', -1) do
      delete questionset_url(@questionset)
    end

    assert_redirected_to questionsets_url
  end
end
