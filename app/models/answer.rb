class Answer < ApplicationRecord
  belongs_to :next_question, class_name: 'Question', optional: true

  mount_uploader :image, PhotoUploader
end
