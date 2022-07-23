class TestsController < ApplicationController
  def index
    @all_tests = Test.all
  end

  def show
    #render html: Test.first
  end
end
