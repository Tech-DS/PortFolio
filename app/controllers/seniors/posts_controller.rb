class Seniors::PostsController < ApplicationController
 #before_action :ensure_current_senior, {only: [:edit, :update, :show]}
  def new
    @post = Post.new
  end

  def create
     @senior = current_senior
     @post = Post.new(post_params)
     @post.senior_id = current_senior.id
    if @post.save
        flash[:notice] = "投稿しました。"
       @posts = Post.all
       redirect_to posts_path
    else
       @posts = Post.all
         flash[:notice] = ' エラーです。'
        render "index"
    end
  end

  def index
    @posts = current_senior.posts.order(created_at: :desc)
    @post = Post.new
    #@senior = Senior.find(current_senior.id)
  end

  def show
    @post = Post.find(params[:id])

    if junior_signed_in?
      seniors_array = current_junior.follow_seniors.pluck(:senior_id)
      senior_id = @post.senior_id

      unless seniors_array.include?(senior_id) == true
        flash[:notice] = "フォローしている方のみアクセスできます。"
        redirect_to juniors_seniors_path
      end

    elsif senior_signed_in?

      unless current_senior == @post.senior
        flash[:notice] = "ご自身の投稿しか表示できません"
        redirect_to posts_path
      end

    end
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
     redirect_to posts_path(@post), notice: "編集しました。"
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

  def ensure_current_senior
     @post = Post.find(params[:id])
    if current_senior.id != @post.senior_id.to_i
     flash[:notice]="権限がありません"
     redirect_to("/posts/index")
    end
  end
end
