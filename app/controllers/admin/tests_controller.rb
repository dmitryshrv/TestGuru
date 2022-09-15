class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy update_inline]
  before_action :set_tests, only: %i[index update_inline]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_test_not_found

  def index

  end

  def show
    @test
  end

  def new
    @test = Test.new
  end

  def edit
    @test
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      flash[:success] = t('.success')
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      flash[:success] = t('.update')
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    flash[:success] = t('.delete')
    redirect_to admin_tests_path
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  private

  def set_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_test_not_found
    render plain: "Test not found"
  end
end
