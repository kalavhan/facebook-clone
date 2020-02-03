# frozen_string_literal: true

class CommentsController < ApplicationController
  attr_accessor :post_id
  def new
    @comment = Comment.new
    @post_id = params[:post_id]
    @post = Post.find_by(id: @post_id)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    @post = Post.find_by(id: params[:post_id])
    if @comment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
