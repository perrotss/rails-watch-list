class BookmarksController < ApplicationController
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

    @list = List.find(params[:list_id])
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
end
