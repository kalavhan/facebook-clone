class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
end
