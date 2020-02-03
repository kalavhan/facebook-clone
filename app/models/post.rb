# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments
  validates :content, presence: true, length: { maximum: 255 }

  def self.find_user_posts(id)
    Post.where(user_id: id)
  end
end
