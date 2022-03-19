class HomesController < ApplicationController
  def top
    @genres = Genre.all
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
