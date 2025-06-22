class Planner < ApplicationRecord
  belongs_to :user

  has_many :schedules, dependent: :destroy
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
