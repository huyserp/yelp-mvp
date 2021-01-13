class Review < ApplicationRecord
  belongs_to :restaurant
  NUMBER_SET = [0, 1, 2, 3, 4, 5]
  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: NUMBER_SET }, numericality: { only_integer: true }
end
