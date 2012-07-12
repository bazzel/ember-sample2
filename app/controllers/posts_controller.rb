class PostsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Post.all
  end

  def show
    respond_with Post.find(params[:id])
  end

  # # GET /posts/new
  # # GET /posts/new.json
  # def new
  #   @post = Post.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @post }
  #   end
  # end

  # # GET /posts/1/edit
  # def edit
  #   @post = Post.find(params[:id])
  # end

  # # POST /posts
  # # POST /posts.json
  # def create
  #   @post = Post.new(params[:post])

  #   respond_to do |format|
  #     if @post.save
  #       format.html { redirect_to @post, notice: 'Post was successfully created.' }
  #       format.json { render json: @post, status: :created, location: @post }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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

  # # DELETE /posts/1
  # # DELETE /posts/1.json
  # def destroy
  #   @post = Post.find(params[:id])
  #   @post.destroy

  #   respond_to do |format|
  #     format.html { redirect_to posts_url }
  #     format.json { head :no_content }
  #   end
  # end
end
