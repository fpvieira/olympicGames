class Discipline < ApplicationRecord
  validates :name, presence: true
  validates :slug, presence: true
  validates :rule_type, presence: true

  has_many :competitions
end