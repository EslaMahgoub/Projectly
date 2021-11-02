FactoryBot.define do
  factory :role do
    name {"client"}

    trait :admin do
      name {"admin"}
    end

  end
end
