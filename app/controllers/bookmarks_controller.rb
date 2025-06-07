class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    bookmarks = current_user.bookmarks.includes(:bookmarkable)

    @planners  = bookmarks.select { |b| b.bookmarkable_type == "Planner" }
    @schedules = bookmarks.select { |b| b.bookmarkable_type == "Schedule" }

    @type_filter = params[:type_filter]
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
