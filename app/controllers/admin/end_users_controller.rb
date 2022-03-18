class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    redirect_back(fallback_location: root_path)
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :is_delete)
  end
end
