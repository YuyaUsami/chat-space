FactoryGirl.define do
  factory :user do
    name                  { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              "aaaaaaaa"
    password_confirmation "aaaaaaaa"

    trait :with_email do
      email nil
    end

    trait :with_password do
      password nil
    end

    trait :with_password_confirmation do
      password_confirmation ""
    end

    trait :with_password_relationship_more do
      password "00000000"
      password_confirmation "00000000"
    end

    trait :with_password_relationship_less do
      password "0000000"
      password_confirmation "0000000"
    end
  end
end
