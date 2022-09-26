class FeedbackMailer < ApplicationMailer
  def feedback_send(message, user)
    @message = message
    mail to: 'sharov.dmitrij@gmail.com',
         subject: "Сообщение с сайта TestGurur от #{user.email}"
  end
end
