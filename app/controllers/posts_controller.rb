class PostsController < ApplicationController
  def index; 
  @user = User.find(params[:user_id])
  @posts = @user.posts
  end
  def show;

  @user = User.find(params[:user_id])
  @post = Post.find(params[:id])
  @comments = Comment.where(post_id: params[:id])
end
end

