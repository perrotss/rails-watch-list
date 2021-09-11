class BookmarksController < ApplicationController
  before_action :set_list, only: %i[create new]

  def new
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list)
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)

    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      render :new
    end
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
