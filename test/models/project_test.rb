require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  def setup
    @admin_user = build(:admin)
    @client_user = build(:client)
    @company = build(:company)
    @client_company = build(:company)
    @subject_area = build(:subject_area)
    @source_language = build(:source_language)
    @target_language = build(:target_language) 
    @project = create(:project_with_target_languages)
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
    @project.source_file = ""
    assert_not @project.valid?
  end

  test "target_languages be present" do
    @project.target_languages = []
    assert_not @project.valid?
  end

  test "start date in the future" do
    @project.start_date = 2.days.ago
    @project.delivery_date = 2.days.ago
    assert_not @project.valid?
  end

  test "delivery date in the future" do
    @project.delivery_date = 2.days.ago
    assert_not @project.valid?
  end

  test "name maximum length" do
    @project.name = "a" * 201
    assert_not @project.valid?
  end

  
end
