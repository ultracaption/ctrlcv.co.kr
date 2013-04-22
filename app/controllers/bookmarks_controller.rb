class BookmarksController < ApplicationController
  before_filter :set_active_menu_to_assessments_mine

  def index
    @lectures = current_user.bookmarks(include: :lecture).map { |b| b.lecture }
    @bookmark = true

    render 'lectures/search'
  end

  def create
    lecture = Lecture.find params[:lecture_id]
    if current_user.bookmarked?(lecture)
      bookmark = Bookmark.where(lecture_id: lecture.id, user_id: current_user.id).first
      bookmark.destroy
    else
      bookmark = Bookmark.new
      bookmark.lecture = lecture
      bookmark.user = current_user
      bookmark.save
    end
    redirect_to :back
  end
end
