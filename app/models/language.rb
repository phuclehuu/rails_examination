class Language < ApplicationRecord
	has_and_belongs_to_many :guides
	validates :code, uniqueness: true, presence: true
end
