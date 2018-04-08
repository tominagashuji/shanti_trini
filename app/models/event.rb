class Event < ApplicationRecord
belongs_to :yoggy

mount_uploader :image, ImageUploader

end
