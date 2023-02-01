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
    # new object from params
    @post = Post.new(post_params)

    # respond_to block
    respond_to do |format|
      format.html do
        if @post.save
          # success message
          flash[:success] = 'Post created successfully'
          # redirect to index
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be created'
          # render new
          render :new, locals: { post: @post }
        end
      end
    end
  end

  def destroy
    Post.find(params[:id]).delete
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
