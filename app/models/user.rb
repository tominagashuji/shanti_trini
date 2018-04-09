class User < ApplicationRecord

  validates :name, presence: true
  validates :email, presence: true

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  before_save {email.downcase!}

  has_secure_password

  validates :password, presence: true, length: {minimum: 6}

  has_many :events
  has_many :events, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorites_events, through: :favorites, source: :event

end
