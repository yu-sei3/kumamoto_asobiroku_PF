class Public::PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    post_image = PostImage.new(post_image_params)
    post_image.end_user_id = current_end_user.id
    post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.find(params[:id])
    @post_image.get_image
  end

  def show
  end

  def edit
  end

  private

  def post_image_params
    params.require(:post_image).permit(:end_user_id, :genre_id, :body, :location, :image)
  end

end
