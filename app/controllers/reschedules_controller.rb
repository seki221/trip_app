# app/controllers/reschedules_controller.rb
class ReschedulesController < ApplicationController
  def create
    original = Schedule.find(params[:schedule_id])
    planner  = Planner.find(params[:planner_id])

    # 複製（コピー）
    new_schedule = Schedule.create!(
      planner: planner,
      user: current_user,
      destination: original.destination,
      start_date: original.start_date,
      end_date: original.end_date,
      cost: original.cost,
      description: original.description
    )

    Reschedule.create!(
      user: current_user,
      planner: planner,
      original_schedule: original
    )

    redirect_to planner_path(planner), notice: "スケジュールをコピーしました"
  end
end
