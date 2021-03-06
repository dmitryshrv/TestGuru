class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question
  end

  def new
  end

  def create
    new_question = @test.questions.new(body: question_params[:body])
    if new_question.save
      redirect_to test_questions_path
    else
      render plain: "Failed to create new question"
    end
  end

  def destroy
    @question.destroy
    render plain: 'Questions deleted'
  end

  private

  def find_test
    @test = Test.find_by(id: params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_question_not_found
    render plain: "Question not found"
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
