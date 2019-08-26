class QuestionAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :answer

  validates :answer_id, uniqueness: { scope: :question_id}
end
