class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
  	@posts = Post.where(user_id: current_user).order('created_at DESC')
  end

  def show
  end

  def new
  	@post = current_user.posts.build
  end

  def create
  	@post = current_user.posts.build(post_params)

  	if @post.save
  		redirect_to posts_path
  	else
  		render :new
  	end
  end

  def edit
  end

  def update
  	@post.update(post_params)

  	if @post.save
  		redirect_to @post
  	else
  		render :edit
  	end
  end

  def destroy
  	@post.destroy
  	redirect_to posts_path
  end

  private
  def set_post
  	@post = Post.find(params[:id])
  end

  def post_params
  	params.require(:post).permit(:title, :content)
  end
end
