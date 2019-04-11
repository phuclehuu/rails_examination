class Activity < ApplicationRecord
	has_and_belongs_to_many :guides
	validates :name, uniqueness: true, presence: true
end
