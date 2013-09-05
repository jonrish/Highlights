class UserMailer < ActionMailer::Base
  default from: "jon@youmaketheplay.com"

  def processing_email(user)
  	@user = user
  	@url = 'http://localhost:3000/users/sign_in'

  	mail(to: @user.email, subject: 'Your Highlight')
  end

  def accepted_email(user)
  	@user = user
  	@url = 'http://localhost:3000/users/sign_in'

  	mail(to: @user.email, subject: 'Highlight Accepted')
  end

  def production_email(user)
  	@user = user
  	@url = 'http://localhost:3000/users/sign_in'

  	mail(to: @user.email, subject: 'Highlight in Production')
  end

  def complete_email(user)
  	@user = user
  	@url = 'http://localhost:3000'

  	mail(to: @user.email, subject: 'Highlight Ready to Download')
  end


end