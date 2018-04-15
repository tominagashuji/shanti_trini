class Event < ApplicationRecord

  validates :title, presence: true
  validates :image, presence: true

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user

  mount_uploader :image, ImageUploader

  paginates_per 5

end
