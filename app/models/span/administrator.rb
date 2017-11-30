# app/models/span/administrator.rb

module Span
  class Administrator < ActiveRecord::Base
    has_secure_password

    include SetSlug
    include StringGenerator
    include AuthTokenGenerator
    include ResetPasswordTokenGenerator

    before_validation :generate_auth_token, on: :create, uniqueness: true

    # Validations
    validates :name, presence: true
    validates :surname, presence: true
    validates :username, presence: true
    validates :email, presence: true, uniqueness: :true, email: true
    validates :password, length: { in: 8..16 }, allow_nil: true

    def send_reset_password
      generate_reset_password_token(:reset_password_token)
      self.reset_password_sent_at = Time.zone.now
      save!
      # ResetPasswordJob.set(wait: 30.seconds).perform_later(self)
      ResetPasswordMailer.reset_password(self).deliver_later
    end
  end
end
