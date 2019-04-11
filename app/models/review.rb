class Review < ApplicationRecord
  belongs_to :guide
  validates :score, presence: true, numericality: { :greater_than => 0, :less_than => 6 }
end
