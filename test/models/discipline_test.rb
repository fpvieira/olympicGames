require 'test_helper'

class DisciplineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save discipline without title" do
    discipline = Discipline.new
    assert_not discipline.save
  end
end
