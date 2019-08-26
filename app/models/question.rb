class Question < ApplicationRecord
  has_many :question_answers
  has_many :answers, through: :question_answers

  def assign_answers(answers)
    answers.each do |answer|
      self.question_answers.build(answer: answer).save
    end
  end
end
