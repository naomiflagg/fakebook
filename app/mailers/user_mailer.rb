class UserMailer < ApplicationMailer
  default from: 'naoflagg@gmail.com'

  def welcome_email
    @user = params[:user]
    @url = 'https://polar-island-23304.herokuapp.com/'
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(to: email_with_name, subject: 'Welcome to Fakebook!')
  end
end
