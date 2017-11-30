# db/migrate/*_create_span_timeline_settings.rb

class CreateSpanTimelineSettings < ActiveRecord::Migration
  def change
    create_table :span_timeline_settings do |t|
      t.string :slug, unique: true, index: true

      # SEO & OP Meta Tags
      t.string :seo_title
      t.text :seo_description
      t.string :seo_tags
      t.string :seo_imagebox

      t.timestamps null: false
    end
  end
end
