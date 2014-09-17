ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "needafourth.com",
  :user_name            => "noreply.needafourth@gmail.com",
  :password             => "mypassword1",
  :authentication       => "plain",
  :enable_starttls_auto => true
}