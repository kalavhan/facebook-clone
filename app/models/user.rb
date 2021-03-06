class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :likes
  has_many :comments
  has_many :sent_requests, foreign_key: 'sender_id', class_name: 'Friendship'
  has_many :received_requests, foreign_key: 'receiver_id', class_name: 'Friendship'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :omniauthable, omniauth_providers: [:facebook]
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :location, length: { maximum: 40 }
  validates :bio, length: { maximum: 150 }
  validates_inclusion_of :gender, in: %w[Male Female], allow_nil: true
  validates_inclusion_of :status, in: ['Single', 'Married', 'In a relationship'], allow_nil: true

  def friends
    sent_requests.map { |friendship| friendship.sender_id if friendship.status == 'accepted' }.compact
  end

  def self.all_friends(user_id)
    User.where('id != ?', user_id)
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'])
        user.email = data['emai'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name.split(' ')[0]
      user.last_name = auth.info.name.split(' ')[1]
    end
  end
end
