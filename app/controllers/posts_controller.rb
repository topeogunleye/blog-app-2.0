class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id]).order(created_at: :desc).includes(:comments).paginate(
      page: params[:page], per_page: 10
    )
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
    @post = Post.find(params[:id])
    @post.likes.delete_all
    @post.destroy
    @post.update_posts_counter
    respond_to do |format|
      format.html do
        flash[:success] = 'Post deleted successfully'
        redirect_to user_posts_url
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html { render :edit, locals: { post: @post } }
    end
  end

  def update
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html do
        if @post.update(post_params)
          flash[:success] = 'Post updated successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be updated'
          render :edit, locals: { post: @post }
        end
      end
    end
  end

  private

  def post_params
    post_params = params.require(:post).permit(:user_id, :title, :text)
    post_params[:author_id] = current_user.id
    post_params
  end
end
