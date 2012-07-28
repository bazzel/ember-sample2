class CommentsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Comment.all
  end
end
