require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @admin_user = build(:user)
    @client_user = build(:client)
    @company = build(:company)
    @client_company = build(:company)
    @subject_area = build(:subject_area)
    @source_language = build(:source_language)
    @target_language = build(:target_language) 
    @project = create(:project_with_target_languages, user: @admin_user)
    @second_project = create(:project_with_target_languages)
    
  end

  test "should get index" do
    sign_in @admin_user
    get projects_path
    assert_response :success
  end

  test "should get new" do
    sign_in @admin_user
    get new_project_path
    assert_response :success
  end

  test "should create project" do
    sign_in @admin_user
    assert_difference('Project.count') do
      post projects_path, params: { project: {name: @project.name, start_date: @project.start_date, delivery_date: @project.delivery_date, company_id: @project.company,  description: @project.description, instructions: @project.instructions, reference_file: @project.reference_file, source_file: @project.source_file, source_language_id: @project.source_language, user_id: @admin_user } }
    end
    assert_redirected_to project_path(Project.last)
  end

  test "should not create if missing required fields" do
    sign_in @admin_user
    assert_no_difference('Project.count') do
      post projects_path, params: { project: {name: "", start_date: "", delivery_date: @project.delivery_date, company_id: @company,  description: @project.description, instructions: @project.instructions, reference_file: @project.reference_file, source_file: @project.source_file, source_language_id: @project.source_language, user_id: @admin_user } }
    end
  end

  test "should show project" do
    sign_in @admin_user
    get project_path(@project)
    assert_response :success
  end

  test "should get edit" do
    sign_in @admin_user
    get edit_project_path(@project)
    assert_response :success
  end

  test "should update project" do
    sign_in @admin_user
    patch project_path(@project), params: { project: {name: "New Project", description: "New Description"} }
    assert_redirected_to project_path(@project)
  end

  test "should not update if missing required fields" do
    sign_in @admin_user
    name = ""
    patch project_path(@project), params: { project: {name: name, source_file: "" } }
    assert @project.name != name
  end

  test "should destroy project" do
    sign_in @admin_user
    assert_difference('Project.count', -1) do
      delete project_path(@project)
    end
    assert_redirected_to created_projects_path
  end
end