class Activity < ApplicationRecord
	has_many :activities_guides
	has_many :guides, through: :activities_guides
	validates :name, uniqueness: true, presence: true
end
