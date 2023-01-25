class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :desc)
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end
end
