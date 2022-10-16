class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? || time_not_expired?
      TestsMailer.completed_test(@test_passage).deliver_now
      @test_passage.pass
      BadgeService.new(@test_passage).give_badge if @test_passage.success?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def time_not_expired?
    @test_passage.passed_time < @test_passage.test.deadline
  end

  def gist
    git_service = GistQuestionService.new(@test_passage.current_question)
    result = git_service.call

    flash_options = if git_service.success?
      @test_passage.current_question.gists.create(user: current_user, url: result.html_url)
      {notice: t('.success', url: result.html_url) }
    else
      {alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
