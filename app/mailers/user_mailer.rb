class UserMailer < ApplicationMailer
  default :from => "nataliibondarenko@ukr.net"

  def registration_confirmation(user,confirmation_token)
    @user = user
    @confirmation_token = confirmation_token
    mail(:to => "<#{@user.email}>", :subject => "Registration Confirmation")
  end
end
