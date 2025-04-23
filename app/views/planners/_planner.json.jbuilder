json.extract! planner, :id, :user_id, :title, :start_date, :end_date, :created_at, :updated_at
json.url planner_url(planner, format: :json)
