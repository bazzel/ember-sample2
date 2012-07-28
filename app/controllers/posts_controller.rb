class PostsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Post.includes(:comments).all
  end

  def show
    respond_with Post.find(params[:id])
  end

  def create
    respond_with Post.create(params[:post])
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    respond_with @post
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_with @post
  end
end
