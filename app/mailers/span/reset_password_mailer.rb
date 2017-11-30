# app/mailer/span/reset_password_mailer.rb

module Span
  class ResetPasswordMailer < ActionMailer::Base
    # Default Settings
    default from: "no-reply@lim9.com"

    # Password Reset
    def reset_password(administrator)
      @administrator = administrator
      mail(
        to: @administrator.email,
        subject: "Password Reset Request",
        template_path: "span/mailers"
      )
    end
  end
end
