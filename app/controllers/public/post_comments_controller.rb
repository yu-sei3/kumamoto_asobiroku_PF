class Public::PostCommentsController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @comment = current_end_user.post_comments.new(post_comment_params)
    @comment.end_user_id = current_end_user.id
    @comment.post_image_id = params[:post_image_id]
    if @comment.save
      render :post_comment
    else
      render :post_comment
    end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    @comment = PostComment.find(params[:id])
    @comment.destroy
    render :post_comment
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
