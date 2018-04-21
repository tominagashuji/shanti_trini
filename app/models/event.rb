class Event < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorites_users, through: :favorites, source: :user

  validates :title, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  paginates_per 5
end
