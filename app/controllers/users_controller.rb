class UsersController < ApplicationController
  def index
    @users = User.all.order(id: :asc)
    @posts = Post.all.order(id: :desc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc)
    @latest_posts = @user.posts.order(id: :desc).limit(5)
  end
end
