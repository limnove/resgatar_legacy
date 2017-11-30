class AddOfflineTitleToSpanSettings < ActiveRecord::Migration
  def change
    add_column :span_settings, :offline_title, :string
  end
end
