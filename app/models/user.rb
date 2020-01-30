# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :location, length: { maximum: 40 }
  validates :bio, length: { maximum: 150 }
  validates_inclusion_of :gender, :in => ['Male', 'Female'], :allow_nil => true
  validates_inclusion_of :status, :in => ['Single', 'Married', 'In a relationship'], :allow_nil => true
end
