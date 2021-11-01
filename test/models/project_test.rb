require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    @admin_user = users(:admin)
    @client_user = users(:client)
    @company = companies(:milengo)
    @client_company = companies(:client_company)
    @subject_area = subject_areas(:aerospace)
    @source_language = source_languages(:english)
    @target_language = target_languages(:german) 
    @project = Project.new(name: "Test Project", start_date: Time.now.to_date, 
                        delivery_date: Time.now.to_date + 2, company_id: @company.id,  
                        description: "Test Descirption", instructions: "Test Instructions", 
                        reference_file: "reference file", source_file: "source file",
                        source_language_id: @source_language.id,  target_languages: @target_language.ids, user_id: @user.id )
  end

  test "should be valid" do
    assert @project.valid?
  end

  test "name should be present" do
    @project.name = " "
    assert_not @project.valid?
  end

  test "description be present" do
    @project.description = " "
    assert_not @project.valid?
  end

  test "start date be present" do
    @project.delivery_date = ""
    assert_not @project.valid?
  end

  test "delivery date be present" do
    @project.delivery_date = ""
    assert_not @project.valid?
  end

  test "company be present" do
    @project.company_id = ""
    assert_not @project.valid?
  end

  test "source file be present" do
    @project.target_languages = ""
    assert_not @project.valid?
  end

  test "target_languages be present" do
    @project.target_languages = ""
    assert_not @project.valid?
  end

  test "start date in the future" do
    @project.start_date = Time.now.yesterday.beginning_of_day
    assert_not @project.valid?
  end

  test "delivery date in the future" do
    @project.delivery_date = Time.now.yesterday.beginning_of_day
    assert_not @project.valid?
  end

  test "name maximum length" do
    @project.name = "a" * 201
    assert_not @project.valid?
  end

  
end
