class User < ApplicationRecord
  has_many :events
  has_many :events, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorites_events, through: :favorites, source: :event

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :image, presence: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}

  before_save {email.downcase!}

  mount_uploader :image, ImageUploader

end
