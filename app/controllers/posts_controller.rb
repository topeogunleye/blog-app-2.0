class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :desc)
    @latest_posts = Post.all.order(id: :desc).limit(5)
  end

  def show
    @post = Post.find(params[:id])
  end
end
