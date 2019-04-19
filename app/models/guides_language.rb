class GuidesLanguage < ApplicationRecord
	belongs_to :guide, touch: true
	belongs_to :language
end