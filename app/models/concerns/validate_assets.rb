# app/model/concerns/validate_assets.rb

module ValidateAssets
  extend ActiveSupport::Concern
  included do
    # Select and clean considering video source
    before_validation :clean_video_id, if: :video?, on: :create

    # Validations
    validates :title, presence: true, if: :image?
    validates :title, presence: true, if: :video?
    validates :title, presence: true, if: :document?
    validates :textbox, presence: true, if: :text?
    validates :imagebox, presence: true, if: :image?
    validates :videobox, presence: true, if: :video?
    validates :documentbox, presence: true, if: :document?
  end

  # module ClassMethods
  # end
end
