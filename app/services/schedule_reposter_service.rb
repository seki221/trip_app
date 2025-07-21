class ScheduleReposterService
  def initialize(user:, bookmark_id:, planner_id:)
    @user        = user
    @bookmark    = user.bookmarks.find(bookmark_id)
    @planner     = user.planners.find(planner_id)
  end

  def call
    original = @bookmark.bookmarkable
    @planner.schedules.create!(
      # title:       original.title,
      destination: original.destination,
      start_date:  original.start_date,
      end_date:    original.end_date,
      user:        @user
    )
  end
end
