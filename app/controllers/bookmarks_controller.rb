class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = current_user.bookmarks.where(bookmarkable_type: "Planner")

    if params[:type_filter].present?
      @bookmarks = @bookmarks.where(bookmarkable_type: params[:type_filter])
    end
  end

  def create
    @bookmarkable = find_bookmarkable
    @bookmark = @bookmarkable.bookmarks.new(user: current_user)

    if @bookmark.save
      redirect_back fallback_location: root_path, notice: "ブックマークしました"
    else
      redirect_back fallback_location: root_path, alert: "ブックマークできませんでした"
    end
  end

  def create_schedule
    bookmark = current_user.bookmarks.find(params[:id])
    planner_id = params[:planner_id]

    # Bookmark先がScheduleであることを前提に処理（要調整）
    if bookmark.bookmarkable_type == "Schedule"
      original = bookmark.bookmarkable
      Schedule.create!(
        planner_id: planner_id,
        destination: original.destination,
        start_date: original.start_date,
        description: original.description,
        # 他にも必要なフィールドをコピー
      )
      redirect_to bookmarks_path, notice: "スケジュールを追加しました"
    else
      redirect_to bookmarks_path, alert: "対応していないタイプです"
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_back fallback_location: root_path, notice: "ブックマークを削除しました"
  end

  private

  def find_bookmarkable
    params[:bookmarkable_type].classify.constantize.find(params[:bookmarkable_id])
  end
end
