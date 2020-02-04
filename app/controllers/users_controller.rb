# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    #@users = User.left_outer_joins(:received_requests).where('friendships.status = ?', 'accepted')
    @users = User.show_non_friends(current_user.id)
  end

  def show
    @requests = Friendship.where('receiver_id = ? and status = ?', current_user.id, 'pending')
  end
end
