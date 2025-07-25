# rubocop:disable Style/StringLiterals
# require 'geocoder'
# rubocop:enable Style/StringLiterals

class Schedule < ApplicationRecord
  before_save :set_coordinates
  belongs_to :user
  belongs_to :planner
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
  has_one_attached :image

  validate :dates_within_planner_range

  scope :sort_new, -> { order(start_date: :desc) }
  scope :sort_old, -> { order(start_date: :asc) }
  def dates_within_planner_range
    return if planner.blank?

    # planner.end_date を1日の終わりとして評価
    range_end = planner.end_date.end_of_day

    if start_date.present? && start_date < planner.start_date.beginning_of_day ||
      end_date.present? && end_date > range_end
      errors.add(:base, "スケジュールはしおりの日付内で設定してください")
    end
  end

  validate :valid_date_range

  def valid_date_range
    if start_date.blank? && end_date.blank?
      errors.add(:base, "開始日か終了日のどちらかを入力してください")
    elsif start_date.present? && end_date.present? && start_date > end_date
      errors.add(:base, "開始日は終了日より前にしてください")
    end
  end

  def set_coordinates
    return if latitude.present? && longitude.present?
    results = Geocoder.search(address)
    if geo = results.first
      self.latitude = geo.latitude
      self.longitude = geo.longitude
    end
  end
end
