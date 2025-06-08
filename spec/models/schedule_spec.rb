require 'rails_helper'

RSpec.describe Schedule, type: :model do
  let(:user) { User.create!(email: "test@example.com", password: "password") }
  let(:planner) { Planner.create!(title: "テストしおり", start_date: Date.today, end_date: Date.today + 5, user: user) }

  it "開始日だけでも有効" do
    schedule = Schedule.new(start_date: Date.today + 1, planner: planner, user: user)
    expect(schedule).to be_valid
  end

  it "終了日だけでも有効" do
    schedule = Schedule.new(end_date: Date.today + 2, planner: planner, user: user)
    expect(schedule).to be_valid
  end

  it "両方なければ無効" do
    schedule = Schedule.new(planner: planner, user: user)
    expect(schedule).not_to be_valid
    expect(schedule.errors[:base]).to include("開始日か終了日のどちらかを入力してください")
  end

  it "しおりの範囲外の日付は無効" do
    schedule = Schedule.new(start_date: planner.start_date - 1, planner: planner, user: user)
    expect(schedule).not_to be_valid
    expect(schedule.errors[:base]).to include("スケジュールはしおりの日付内で設定してください")
  end
end
