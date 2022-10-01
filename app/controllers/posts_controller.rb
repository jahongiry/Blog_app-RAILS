class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.joins(:author).where(author: { id: params[:user_id] }).find(params[:id])
    @comments = @post.comments
  end
end
