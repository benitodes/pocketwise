class Category < ApplicationRecord
  has_many :courses, dependent: :destroy
  mount_uploader :photo, PhotoUploader
end
