# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_user_mailer
  def new_user_mailer
    UserMailer.registration_confirmation(User.new(email:'aa@mail.ua'))
  end

end
