class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :planner

  validate :dates_within_planner_range

  def dates_within_planner_range
    return if planner.blank?

    if start_date.present? && start_date < planner.start_date ||
      end_date.present? && end_date > planner.end_date
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
end
