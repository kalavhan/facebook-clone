class LikesController < ApplicationController
  def create
    @like = Like.new
    @like.user_id = current_user.id
    @like.post_id = params[:post_id]
    @like.save
    redirect_to root_path
  end

  def destroy
    post_id = params[:post_id]
    Like.where(["user_id = ? and post_id = ?", current_user.id, post_id]).destroy_all
    redirect_to root_path
  end

  private

  #def like_params
  #  params.require(:like).permit(:user_id, :post_id)
  #end
end
