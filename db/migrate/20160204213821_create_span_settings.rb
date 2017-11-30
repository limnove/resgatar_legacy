# db/migrate/*_create_span_settings.rb

class CreateSpanSettings < ActiveRecord::Migration
  def change
    create_table :span_settings do |t|
      t.string :slug, unique: true, index: true
      t.string :sitemapbox
      t.string :documentbox
      t.boolean :published, default: false

      # SEO & OP Meta Tags
      t.string :seo_title
      t.text :seo_description
      t.string :seo_tags
      t.string :seo_imagebox

      t.timestamps null: false
    end
  end
end
