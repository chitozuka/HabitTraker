FactoryBot.define do
  factory :habit do
    sequence(:name) { |n| "NAME_#{n}" }
  end
end
