class Public::PostImagesController < ApplicationController
  # 会員以外のaction制限
  before_action :authenticate_end_user!, only: [:create, :show, :update,]

  def new
    @post_image = PostImage.new
    @maps = Map.all
    @map = Map.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.end_user_id = current_end_user.id
    if @post_image.save
      flash[:notice] = "投稿されました！！"
      map = Map.new(post_image_maps_params)
      map.post_image_id = @post_image.id
      map.save
      redirect_to post_image_path(@post_image)
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.all.order(created_at: :desc)
    @genres = Genre.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = current_end_user.post_comments
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to post_image_path(@post_image)
    else
      render :edit
    end
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def post_image_params
    params.require(:post_image).permit(:end_user_id, :genre_id, :title, :body, :location, :image)
  end

  def post_image_maps_params
    params.require(:post_image).permit(:latitube, :longitube)
  end

end
