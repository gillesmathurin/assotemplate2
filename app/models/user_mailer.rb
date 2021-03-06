class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += "Veuillez s'il vous plait, activer votre compte."
  
    @body[:url]  = "http://association.gmwebagency.com/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Votre compte a été activé!'
    @body[:url]  = "http://association.gmwebagency.com/"
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "gillesmath@gmwebagency.com"
      @subject     = "[association.gmwebagency.com] "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
