class Public::RelationshipsController < ApplicationController

  def create
    current_end_user.follow(params[:end_user_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_end_user.unfollow(params[:end_user_id])
    redirect_back(fallback_location: root_path)
  end

end
