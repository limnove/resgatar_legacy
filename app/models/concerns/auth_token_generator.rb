# app/model/concerns/auth_token_generator.rb

module AuthTokenGenerator
  extend ActiveSupport::Concern
  # Auth token
  def generate_auth_token
    loop do
      self.authentication_token = SecureRandom.urlsafe_base64
      break unless self.class.exists? authentication_token: authentication_token
    end
  end
end
