class FeedbackMailer < ApplicationMailer
  def feedback_send(message, user)
    @message = message
    mail to: 'sharov.dmitrij@gmail.com', subject: user.email
  end
end
