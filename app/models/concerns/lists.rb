# app/model/concerns/lists.rb

module Lists
  extend ActiveSupport::Concern
  # Better listing
  included do
    scope :list_all, -> { order(position: :asc, created_at: :asc) }
    scope :published_all, -> { order(position: :asc, created_at: :asc).where(published: true) }
    scope :highlight_all, -> { order(position: :asc, created_at: :asc).where(published: true, highlight: true) }
    scope :off_highlight_all, -> { order(position: :asc, created_at: :asc).where(published: true, highlight: false) }
    scope :unpublished_all, -> { order(position: :asc, created_at: :asc).where(published: false) }
  end

  # module ClassMethods
  # end
end
