class PostCommentsController < ApplicationController

  def create
    if current_senior
      create_post_comment(current_senior)
      redirect_to post_path(params[:post_id])
    elsif current_junior
      create_post_comment(current_junior)
      redirect_to post_path(params[:post_id])
    end
  end

  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

  def create_post_comment(user)
    post = Post.find(params[:post_id])
    comment = user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    comment.save
  end
end
