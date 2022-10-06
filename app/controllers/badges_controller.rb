class BadgesController < ApplicationController
  def index
    @badges = current_user.badges
    @badges_distinct = current_user.badges.distinct
  end
end
