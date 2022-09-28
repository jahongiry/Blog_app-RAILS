class PostsController < ApplicationController
  def index
    @posts = Post.joins(:author).where(author: { id: params[:user_id] })
  end

  def show
    # @post = Post.joins(:author).where(author: { id: params[:user_id] }).find(params[:id])
  end
end