class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new show create destroy]
  before_action :find_question, only: %i[show update edit destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_question_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question
  end

  def new
    @question = @test.questions.new
  end

  def create
    new_question = @test.questions.new(body: question_params[:body])
    if new_question.save
      redirect_to test_path(@test)
    else
      render plain: "Failed to create new question"
    end
  end

  def edit
    @question
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
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
