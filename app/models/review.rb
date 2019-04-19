class Review < ApplicationRecord
  belongs_to :guide, touch: true
  validates :score, presence: true, numericality: { :greater_than => 0, :less_than => 6 }
end
