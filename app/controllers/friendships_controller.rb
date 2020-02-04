# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new
    @friendship.sender_id = current_user.id
    @friendship.receiver_id = params[:friend_id]
    @friendship.status = 'pending'
    @friendship.save
    flash[:notice] = 'Request sent successfully'
    redirect_to users_path
  end

  def reject
    @request = Friendship.get_request(current_user.id, params[:sender_id])[0]
    @request.destroy
    redirect_to received_requests_path
  end

  def accept
    @request = Friendship.get_request(current_user.id, params[:sender_id])
    @request.update(status: 'accepted')
    redirect_to received_requests_path
  end
end
