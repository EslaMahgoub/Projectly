FactoryBot.define do
  factory :subject_area do
    sequence(:name) { |n| "Aerospace #{n}" }
  end
end
