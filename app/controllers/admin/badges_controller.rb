class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show
    @badge
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      flash[:success] = 'Badge successfully created!'
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @badge.update(badge_params)
      flash[:success] = 'Badge successfully updated!'
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    flash[:success] = 'Badge successfully deleted!'
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :rule, :img, :rule_value)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end
