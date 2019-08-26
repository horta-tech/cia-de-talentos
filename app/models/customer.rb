class Customer < ApplicationRecord
  has_many :photos

  mount_uploader :logo, PhotoUploader
end
