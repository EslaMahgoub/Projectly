FactoryBot.define do
  factory :source_language do
    sequence(:name) { |n| "English #{n}" }
  end
end
