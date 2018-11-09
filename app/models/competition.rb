class Competition < ApplicationRecord
  belongs_to :discipline
  has_many :results
  validates :name, presence: true
end