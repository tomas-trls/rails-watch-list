class BookmarksController < ApplicationController
  before_action :set_bookmarks, only: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(params_bookmark)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark.destroy
  end

  private

  def set_bookmarks
    @bookmark = Bookmark.find(params[:id])
  end

  def params_bookmark
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
