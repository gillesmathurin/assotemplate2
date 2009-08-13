# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = { 
#   :address => "mail.crajep971.fr", 
#   :port => 26, 
#   :domain => "crajep971.fr",
#   :authentication => :login, 
#   :user_name => "gillesmath+crajep971.fr", 
#   :password => "30carmen30"
# }
# ActionMailer::Base.perform_deliveries = true
# ActionMailer::Base.raise_delivery_errors = true
# ActionMailer::Base.default_charset = "iso-8859-1"

Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default_charset = "utf-8"

ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true, 
  :address              => "smtp.gmail.com", 
  :port                 => 587, 
  :domain               => 'gmwebagency.com',
  :authentication       => :login,
  :user_name            => "gwadaman30@gmail.com", 
  :password             => "carmen30", 
}


