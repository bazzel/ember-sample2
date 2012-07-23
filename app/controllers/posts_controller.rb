class PostsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Post.all
  end

  def show
    respond_with Post.find(params[:id])
  end

  def create
    respond_with Post.create(params[:post])
  end

  # # PUT /posts/1
  # # PUT /posts/1.json
  # def update
  #   @post = Post.find(params[:id])

  #   respond_to do |format|
  #     if @post.update_attributes(params[:post])
  #       format.html { redirect_to @post, notice: 'Post was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_with @post
  end
end
