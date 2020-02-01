# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }

  def self.find_user_posts(id)
    Post.where(user_id: id)
  end
end
