# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :sent_requests, foreign_key: 'sender_id', class_name: 'Friendship'
  has_many :received_requests, foreign_key: 'receiver_id', class_name: 'Friendship'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :location, length: { maximum: 40 }
  validates :bio, length: { maximum: 150 }
  validates_inclusion_of :gender, in: %w[Male Female], allow_nil: true
  validates_inclusion_of :status, in: ['Single', 'Married', 'In a relationship'], allow_nil: true

  def friends
    sent_requests.map { |friendship| friendship.sender_id if friendship.status = 'accepted' }.compact
  end

  # def self.show_non_friends(user_id)
  #   array = []
  #   friends = Friendship.where('(sender_id = ? and status = ?) OR
  #     (receiver_id = ? and status = ?)',
  #                              user_id, 'accepted',
  #                              user_id, 'accepted')
  #   friends.each do |friend|
  #     array.push(friend.receiver_id)
  #     array.push(friend.sender_id)
  #   end
  #   users = User.where('id != ?', user_id)
  #   users = users.reject { |user| array.include?(user.id) }
  # end

  def self.all_friends(user_id)
    User.where('id != ?', user_id)
  end
end
