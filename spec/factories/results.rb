FactoryGirl.define do
  factory :result do
    name "Some Name"
    result 0.0

    association :competition, factory: :competition
  end
end