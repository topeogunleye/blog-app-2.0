class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :desc).paginate(page: params[:page], per_page: 10)
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.where(author_id: params[:user_id]).find(params[:id])
  end

  def new
    @post = Post.new
    @user = current_user
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
