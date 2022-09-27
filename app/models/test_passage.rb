class TestPassage < ApplicationRecord

  #attr_accessor :q_number

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: :Question, optional: true, dependent: :destroy

  before_validation :before_validation_set_first_question, on: :create
  before_update :next_question

  SUCCESS_GRADE = 85

  def number_of_questions
    self.test.questions.count
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_qustions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def grade
    (self.correct_qustions.to_f/number_of_questions)*100
  end

  def current_progress
    current = test.questions.order(:id).index(current_question)
    (current.to_f / test.questions.count * 100).round
  end

  def success?
    self.grade >= SUCCESS_GRADE
  end

  def question_number
    self.test.questions.where("id <= ?", self.current_question.id).count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct_answer
  end

  def next_question
    self.current_question =
      test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
