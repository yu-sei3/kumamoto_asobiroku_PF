class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(params[:id])
    @post_images = @end_user.post_images
    @following_end_users = @end_user.following_end_user
    @follower_end_user = @end_user.follower_end_user
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def follows
    @end_user = EndUser.find(params[:id])
    @end_users = @end_user.following_end_user
  end

  def followers
    @end_user = EndUser.find(params[:id])
    @end_users = @end_user.follower_end_user
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :body, :profile_image)
  end

end
