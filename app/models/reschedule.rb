class Reschedule < ApplicationRecord
  belongs_to :user
  belongs_to :planner
  belongs_to :original_schedule, class_name: 'Schedule'
end
