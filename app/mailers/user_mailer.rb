class UserMailer < ApplicationMailer
  def send_simple_message
    RestClient.post "https://api:key-f3d19b57ef46f7e0ac7847309b062c8f"
        "@api.mailgun.net/v3/sandbox76bfa7180ef34b0ba87d9a8eabb063b1.mailgun.org/messages",
        :from => "Mailgun Sandbox <postmaster@sandbox76bfa7180ef34b0ba87d9a8eabb063b1.mailgun.org>",
        :to => "Heroku <app79927891@heroku.com>",
        :subject => "Hello Heroku",
        :text => "Congratulations Heroku, you just sent an email with Mailgun!  You are truly awesome!"
  end
end
