module LikesHelper
  def user_likes_post?(post_id)
    @has_like = Like.where(["user_id = ? and post_id = ?", current_user.id, post_id])
    return true if @has_like.length.positive?
    false
  end
end
