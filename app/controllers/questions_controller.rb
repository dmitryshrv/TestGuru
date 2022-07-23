class QuestionsController < ApplicationController

  before_action :find_test, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
    question = Question.create!(body: question_params[:body], test_id: @test.id)
    render plain: "New questions created" unless question.nil?
  end

  def destroy
    Question.find(params[:id]).destroy
    render plain: 'Questions deleted'
  end

  private

  def find_test
    @test = Test.find_by(id: params[:test_id])
  end

  def rescue_question_not_found
    render plain: "Question not found"
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
