# app/model/concerns/default_validations.rb

module DefaultValidations
  extend ActiveSupport::Concern
  # Deafult settings
  included do
    # Validations
    validates :title, presence: true
  end

  # module ClassMethods
  # end
end
