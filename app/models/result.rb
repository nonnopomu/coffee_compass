class Result < ApplicationRecord
  validates :country, presence: true, length: { maximum: 255 }

  has_many :branches
end
