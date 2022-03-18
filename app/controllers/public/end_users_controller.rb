class Public::EndUsersController < ApplicationController
  # 会員以外の機能制限
  before_action :authenticate_end_user!
  # ゲスト用編集機能制限
  before_action :ensure_guest_end_user, only: [:edit]

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

  # ゲスト用制限
  def ensure_guest_end_user
    @end_user = EndUser.find(params[:id])
    if @end_user.name = "guestuser"
      redirect_to end_user_path(current_end_user), notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
