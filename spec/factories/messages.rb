FactoryGirl.define do
  factory :message do
    body "aaaaa"
    image nil
    group_id nil
    user_id nil
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }

    trait :with_body do
      body nil
    end
  end
end
