FactoryBot.define do
  factory :admin do
    sequence(:email) { |n| "example@test#{n}.com" }    
    sequence(:password) { "password" }    
    sequence(:password_confirmation) { "password" }    
  end
end
