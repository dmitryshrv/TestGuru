class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_amount

  scope :correct_answer, ->{ where(correct: true) }

  private

  def validate_answers_amount
    errors.add(:answers, 'Over max answers') if question.answers.count > 3
  end
end
