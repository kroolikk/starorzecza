# -*- encoding: utf-8 -*-
class ContactMailer < ActionMailer::Base
  default from: "starorzecza@gmail.com"

   def contact_email(name, email, content)
    @name = name
    @email = email
    @content  = content
    mail(:to => 'starorzecza@gmail.com', :subject => "Wiadomość z formularza kontaktowego")
  end
end
