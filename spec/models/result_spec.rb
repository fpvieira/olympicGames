require 'rails_helper'

RSpec.describe Result, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:result).save).to be_truthy
  end
  
  it "is invalid without a name" do
    expect(FactoryGirl.build(:result, name: nil).save).to be_falsey
  end

  it "is invalid without a result" do
    expect(FactoryGirl.build(:result, result: nil).save).to be_falsey
  end

  it "is invalid if result is not a number" do
    expect(FactoryGirl.build(:result, result: "some value").save).to be_falsey
  end
end