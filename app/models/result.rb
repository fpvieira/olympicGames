class Result < ApplicationRecord
  belongs_to :competition
  validates :name, presence: true
  validates :result, presence: true
  # validates :quantidade, presence: true
end