class TestsController < ApplicationController
  def index
    @all_tests = Test.all
  end

  def show

  end
end
