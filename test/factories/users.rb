FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@user.com" }
    password {"password123"}    

    factory :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
    
    factory :client do
      after(:create) {|user| user.add_role(:client)}
    end

  end
end
