# app/model/concerns/set_slug.rb

module SetSlug
  extend ActiveSupport::Concern
  # Deafult settings
  included do
    # Callbacks
    before_validation :generate_slug, on: :create, uniqueness: true

    # Call slug instead of ID
    def to_param
      slug
    end
  end

  # module ClassMethods
  # end
end
