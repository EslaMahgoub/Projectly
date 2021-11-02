FactoryBot.define do
  factory :company do
    sequence(:name) { |n| "Milengo #{n}" }
  end
end
