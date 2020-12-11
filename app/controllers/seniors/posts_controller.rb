class Seniors::PostsController < ApplicationController

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

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body, :image)
  end

end
