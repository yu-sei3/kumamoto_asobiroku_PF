class Public::EndUsersController < ApplicationController

  def show
    @end_user = EndUser.find(params[:id])
    @post_images = @end_user.post_images
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :body, :profile_image)
  end

end
