class AdminMailer < ActionMailer::Base
  default from: "postmaster@app18042297.mailgun.org"

  def new_order_email(highlight)
  	@highlight = highlight

  	mail(to: 'jon.m.rish@gmail.com', subject: 'New Highlight Order')
  end
end
