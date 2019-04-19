class Guide < ApplicationRecord
	# has_and_belongs_to_many :languages
	has_many :activities_guides
	has_many :activities, through: :activities_guides

	has_many :guides_languages
	has_many :languages, through: :guides_languages
	has_many :reviews
	validates :email, presence: true, uniqueness: true
end
