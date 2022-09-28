class FeedbacksController < ApplicationController

  def new
  end

  def create
    message = params[:message]
    FeedbackMailer.feedback_send(message, current_user).deliver_now
    flash[:notice] = t('.success')
    redirect_to root_path
  end

end
