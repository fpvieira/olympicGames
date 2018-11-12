require 'rails_helper'

RSpec.describe Competition, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:competition).save).to be_truthy
  end
  
  it "is invalid without a name" do
    expect(FactoryGirl.build(:competition, name: nil).save).to be_falsey
  end
end
