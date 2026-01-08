class Question < ApplicationRecord
  validates :text, presence: true, length: { maximum: 255 }

  has_many :branches, dependent: :destroy
end
