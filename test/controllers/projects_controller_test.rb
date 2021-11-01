require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @first_project = projects(:first_project)
    @second_project = projects(:second_project)
    @admin_user = users(:admin)
    @client_user = users(:client)
    @company = companies(:milengo)
    @client_company = companies(:client_company)
    @subject_area = subject_areas(:aerospace)
    @source_language = source_languages(:english)
    @target_language = target_languages(:german)
  end

  test "should get index" do
    get projects_path
    assert_response :success
  end

  test "should get new" do
    get new_project_path
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_path, params: { project: {name: @first_project.name, start_date: @first_project.start_date, delivery_date: @first_project.delivery_date, company_id: @company,  description: @first_project.description, instructions: @first_project.instructions, reference_file: @first_project.reference_file, source_file: @first_project.source_file, source_language_id: @source_language.id,  target_languages: @target_language.id, user_id: @user.id } }
    end
    assert_redirected_to project_path(Project.last)
  end

  test "should not create if missing required fields" do
    assert_no_difference('Project.count') do
      post projects_path, params: { project: {name: "", start_date: "", delivery_date: @first_project.delivery_date, company_id: @company,  description: @first_project.description, instructions: @first_project.instructions, reference_file: @first_project.reference_file, source_file: @first_project.source_file, source_language_id: @source_language.id,  target_languages: @target_language.id, user_id: @user.id } }
    end
  end

  test "should show project" do
    get project_path(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_path(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_path(@project), params: { project: {name: @second_project.name, start_date: @second_project.start_date, company_id: @client_company.id, delivery_date: @second_project.delivery_date, description: @second_project.description, instructions: @second_project.instructions,  reference_file: @second_project.reference_file, source_file: @second_project.source_file } }
    assert_redirected_to project_path(@project)
  end

  test "should not update if missing required fields" do
    patch project_path(@project), params: { project: {name: "", start_date: @second_project.start_date, company_id: "", delivery_date: @second_project.delivery_date, description: "", instructions: @second_project.instructions,  reference_file: @second_project.reference_file, source_file: @second_project.source_file } }
    assert_redirected_to project_path(@project)
    assert_not flash.empty?
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_path(@project)
    end
    assert_redirected_to created_projects_path
  end
end