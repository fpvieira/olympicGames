FactoryGirl.define do
  factory :competition do
    name "Some Name"

    association :discipline, factory: :discipline
  end
end
