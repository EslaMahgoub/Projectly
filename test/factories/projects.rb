FactoryBot.define do
  factory :project do
    name {"First Project"}
    start_date { Time.zone.today }
    delivery_date { Time.zone.today + 2}
    association :company
    association :user
    association :source_language
    association :subject_area
    description {"First Project Description"}
    instructions {"First Project Instructions"}
    reference_file {File.open(Rails.root.join("test/files/test.txt"))}
    source_file {File.open(Rails.root.join("test/files/test.txt"))}

    factory :project_with_target_languages do
      transient do
        target_languages_count { 5 }
      end

      before(:create) do |project, evaluator|
        create_list(:target_language, evaluator.target_languages_count, projects: [project])
      end
    end

  end
end
