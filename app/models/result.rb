class Result < ApplicationRecord
  belongs_to :competition
  validates :name, presence: true
  validates :result, numericality: true, presence: true
end