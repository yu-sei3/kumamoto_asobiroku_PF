class Public::EndUsersController < ApplicationController
  # 会員以外のaction制限
  before_action :authenticate_end_user!

  # ゲスト用編集機能制限
  # before_action :ensure_guest_end_user, only: [:edit]

  def show
    @end_user = EndUser.find(params[:id])
    @post_images = @end_user.post_images
    @following_end_users = @end_user.following_end_user
    @follower_end_user = @end_user.follower_end_user
  end

  def edit
    @end_user = EndUser.find(params[:id])
    @following_end_users = @end_user.following_end_user
    @follower_end_user = @end_user.follower_end_user
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to end_user_path(@end_user), notice: "編集内容が保存されました"
    else
      render :edit
    end
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
    params.require(:end_user).permit(:name, :introduction, :profile_image)
  end

  # ゲスト用制限
  def ensure_guest_end_user
    @end_user = EndUser.find(params[:id])
    if @end_user.name = "guestuser"
      redirect_to end_user_path(current_end_user), notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

end
