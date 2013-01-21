class SignUpMailer < ActionMailer::Base
  default from: "webmaster@poweredbydra.com", to: "mallrat@mallrat.ca"
  
  def signup(p)
    @name = p[:name]
    @email = p[:email]
    @property = p[:property]
    @phone = p[:phone]
    mail(subject: "Access Request")
  end
end
