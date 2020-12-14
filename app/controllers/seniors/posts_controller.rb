class Seniors::PostsController < ApplicationController
 
  def new
      @post = Post.new
  end

  def create
      @senior = current_senior
      @post = Post.new(post_params)
      @post.senior_id = (current_senior.id)
    if @post.save
     flash[:notice] = "You have creatad book successfully."
       @posts = Post.all
       redirect_to posts_path
    else
       @posts = Post.all
       flash[:notice] = ' errors prohibited this obj from being saved:'
       render "index"
    end
  end

  def index #ユーザーIDでソートをかける（相互フォローのみ）
     @posts = Post.all
     @post = Post.new
  end

  def show
     @post = Post.find(params[:id])
     @post_comment = PostComment.new
  end

  def destroy
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path
  end

  def edit
     @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
    if @post.update(post_params)
     redirect_to posts_path(@post), notice: "You have updated book successfully."
    else
     @posts = Post.all
     render "edit"
    end
  end

  private

  def post_params
     params.require(:post).permit(:body, :image)
  end
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
