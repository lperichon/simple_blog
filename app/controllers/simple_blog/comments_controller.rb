class SimpleBlog::CommentsController < ApplicationController
  layout 'application'
  before_filter :get_post

  def edit
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.attributes = params[:comment]
    if @comment.save
      flash[:notice] = "Comment updated successfully"
      redirect_to post_path(@post)
    else
      render :action => edit
    end
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.post = @post
    
    if @comment.save
      debugger
      flash[:notice] = "Comment created successfully" 
      redirect_to post_path(@post)
    else
      render :action => new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted successfully"
    redirect_to post_path(@post)
  end

  protected

  def get_post
    @post = Post.find(params[:post_id])
  end
end