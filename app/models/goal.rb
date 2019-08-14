class Goal < ApplicationRecord
  belongs_to :wallet
  mount_uploader :picture, PhotoUploader
end
