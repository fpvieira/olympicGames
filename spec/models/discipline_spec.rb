require 'rails_helper'

RSpec.describe Discipline, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "has a valid factory" do
    expect(FactoryGirl.build(:discipline).save).to be_truthy
  end
  
  it "is invalid without a name" do
    expect(FactoryGirl.build(:discipline, name: nil).save).to be_falsey
  end

  it "is invalid without a slug" do
    expect(FactoryGirl.build(:discipline, slug: nil).save).to be_falsey
  end

  it "is invalid without a rule_type" do
    expect(FactoryGirl.build(:discipline, rule_type: nil).save).to be_falsey
  end

end