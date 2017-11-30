class AddOfflineDescriptionToSpanSettings < ActiveRecord::Migration
  def change
    add_column :span_settings, :offline_description, :text
  end
end
