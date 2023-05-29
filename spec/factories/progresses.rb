FactoryBot.define do
  factory :progress do
    association :habit, factory: :habit
  end
end
