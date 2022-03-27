class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @post_images = PostImage.all.order(created_at: :desc).limit(4)
  end

  def about
  end

  def unsubscribe
    @end_user = EndUser.find(params[:id])
  end

  def withdraw
    @end_user = EndUser.find(params[:id])
    @end_user.update(is_delete: true)
    reset_session
    redirect_to root_path
  end

end
