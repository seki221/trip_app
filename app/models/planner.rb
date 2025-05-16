class Planner < ApplicationRecord
  belongs_to :user

  has_many :schedules, dependent: :destroy
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
end
