class PostsController < ApplicationController
  before_action :post_author

  def index
    @posts = @author.posts
  end

  def show
    @post = @author.posts.find(params[:id])
  end

  private

  def post_author
    @author = User.find(params[:user_id])
  end
end
