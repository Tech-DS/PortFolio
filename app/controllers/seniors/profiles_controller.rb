class Seniors::ProfilesController < ApplicationController
  def new
      @senior = current_senior
  end

  def create
      @senior = current_senior
      @senior.address = params[:senior][:address]
      @senior.phone_number = params[:senior][:phone_number]
      @senior.profile_image = params[:senior][:profile_image]
      @senior.birth_date = params[:senior][:birth_date]
    if @senior.save
     flash[:notice] = "You have creatad book successfully."
       @seniors = Senior.all
       redirect_to profiles_path
    else
       @seniors = Senior.all
       flash[:notice] = ' errors prohibited this obj from being saved:'
       render "index"
    end
  end

  def index
     @senior = Senior.find(current_senior.id)

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
     @senior = Senior.find(params[:id])
  end

  def update
     @senior = Senior.find(params[:id])
     @prams = senior_params
    if @senior.update(senior_params)
     redirect_to profiles_path(@senior), notice: "You have updated book successfully."
    else
     @seniors = Senior.all
     render "edit"
    end
  end

  private

  def senior_params
     params.require(:senior).permit(:name, :name_kana, :profile_image, :birth_date, :address, :phone_number)
  end
end
