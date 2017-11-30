# app/model/concerns/count.rb

module Count
  extend ActiveSupport::Concern
  # Better counting
  included do
    scope :count_published_children, -> { where(published: true).count }
    scope :count_unpublished_children, -> { where(published: false).count }
  end

  # module ClassMethods
  # end
end
