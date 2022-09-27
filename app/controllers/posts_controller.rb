class PostsController < ApplicationController
  before_action :post_author

  def show
    @post = @author.posts.find(params[:id])
  end

  def index
    @posts = @author.posts
  end

  private

  def post_author
    @author = User.find(params[:user_id])
  end
end
