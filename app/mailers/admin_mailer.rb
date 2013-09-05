class AdminMailer < ActionMailer::Base
  default from: "me@youmaketheplay.com"

  def new_order_email(highlight)
  	@highlight = highlight

  	mail(to: 'jon.m.rish@gmail.com', subject: 'New Highlight Order')
  end
end
