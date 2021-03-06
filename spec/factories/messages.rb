FactoryBot.define do
  factory :message do
    body { Faker::Lorem.sentence }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }

    trait :with_empty_body do
      body nil
    end
  end
end
