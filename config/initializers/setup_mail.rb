ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "qto.obras",
  :password             => "qto112233",
  :authentication       => "plain",
  :enable_starttls_auto => true
}