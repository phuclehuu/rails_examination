class ActivitiesGuide < ApplicationRecord
	belongs_to :guide, touch: true
	belongs_to :activity
end