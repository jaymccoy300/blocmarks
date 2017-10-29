class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Thanks for liking!"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "Something went wrong with liking. Please try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find_by bookmark_id: @bookmark.id

    if @like.destroy
      flash[:notice] = "Sorry to see your preferences have changed."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "Something went wrong.  Please try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end
end
