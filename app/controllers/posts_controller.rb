class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    # @comments = Comment.includes(:author)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = current_user
    @post = Post.new(strong_params)
    @post.author = @user

    if @post.save
      flash[:success] = 'Post saved!'
      redirect_to user_path(@user.id)
    else
      flash.now[:error] = 'Please fill all fields'
      render :new, status: 422
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Post was successfully deleted.'
        redirect_to user_path(@user.id)
      end
    end
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

  private

  def strong_params
    params.require(:post).permit(:title, :text)
  end
end
