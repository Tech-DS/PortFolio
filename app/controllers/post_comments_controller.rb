class PostCommentsController < ApplicationController
  
  def create
    post = PostImage.find(params[:post_image_id])
    comment = current_senior.post_comments.new(post_comment_params)
    comment = current_junior.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)  
  end

  def destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
