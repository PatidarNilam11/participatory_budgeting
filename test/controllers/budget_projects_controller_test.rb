require "test_helper"

class BudgetProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get budget_projects_index_url
    assert_response :success
  end

  test "should get new" do
    get budget_projects_new_url
    assert_response :success
  end

  test "should get create" do
    get budget_projects_create_url
    assert_response :success
  end

  test "should get show" do
    get budget_projects_show_url
    assert_response :success
  end
end
