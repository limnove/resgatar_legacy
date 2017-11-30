# app/model/concerns/reset_password_token_generator.rb

module ResetPasswordTokenGenerator
  extend ActiveSupport::Concern
  # Reset password token
  def generate_reset_password_token(reset_password_token)
    loop do
      self.reset_password_token = SecureRandom.urlsafe_base64
      break unless self.class.exists? reset_password_token: reset_password_token
    end
  end
end
