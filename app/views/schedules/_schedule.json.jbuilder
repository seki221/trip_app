json.extract! schedule, :id, :user_id, :planner_id, :destination, :start_date, :end_date, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
