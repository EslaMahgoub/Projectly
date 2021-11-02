FactoryBot.define do
  factory :target_language do
    sequence(:name) { |n| "German (Germany) #{n}" }
    sequence(:code) { |n| "de-DE #{n}" } 
    
  end
end
