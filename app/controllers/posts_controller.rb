class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Post Created!"
      render :new
    else 
      flash[:error] = "An error ocurred!"
      render :new
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post Updated!"
      redirect_to @post
    else
      flash[:error] = "An error ocurred, Post not updated!"
      render "edit"
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  private 
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
