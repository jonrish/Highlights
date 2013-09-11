class UserMailer < ActionMailer::Base
  default from: "user@jonrish.mailgun.org"

  def processing_email(user)
  	@user = user
  	@url = user_url(@user, host: 'localhost:3000')

  	mail(to: @user.email, subject: 'Your Highlight')
  end

  def accepted_email(user)
  	@user = user
    @url = user_url(@user, host: 'localhost:3000')

  	mail(to: @user.email, subject: 'Highlight Accepted')
  end

  def production_email(user)
  	@user = user
  	@url = user_url(@user, host: 'localhost:3000')

  	mail(to: @user.email, subject: 'Highlight in Production')
  end

  def complete_email(user)
  	@user = user
  	@url = user_url(@user, host: 'localhost:3000')

  	mail(to: @user.email, subject: 'Highlight Ready to Download')
  end


end
