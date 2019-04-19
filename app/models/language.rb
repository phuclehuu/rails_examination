class Language < ApplicationRecord
	# has_and_belongs_to_many :guides
	has_many :guides_languages
	has_many :guides, through: :guides_languages
	validates :code, uniqueness: true, presence: true
end
