class Photo < ApplicationRecord
  mount_uploader :upload, PhotoUploader
  belongs_to :customer
end
