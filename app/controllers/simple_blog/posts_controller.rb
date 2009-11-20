class SimpleBlog::PostsController < ApplicationController
  layout 'application'
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    redirect_to :action => 'index' unless request.put?
    @post = Post.find(params[:id])
    @post.attributes = params[:post]
    if @post.save
      flash[:notice] = "Post updated successfully"
      redirect_to blog_path
    else
      render :action => 'new'
    end
  end

  def create
    redirect_to :action => 'index' unless request.post?
    if @post = Post.create(params[:post])
      flash[:notice] = "Post created successfully"
      redirect_to blog_path
    else
      render :action => 'new'
    end
  end

  def destroy
    redirect_to :action => 'index' unless request.delete?
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted successfully"
    redirect_to blog_path
  end
end
