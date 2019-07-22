FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "example@test#{n}.com" }    
    password { "password" }    
    password_confirmation { "password" }    
  end
end
