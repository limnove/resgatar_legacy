# db/migrate/*_create_span_timelines.rb

class CreateSpanTimelines < ActiveRecord::Migration
  def change
    create_table :span_timelines do |t|
      t.string :slug, unique: true, index: true
      t.string :title
      t.text :description
      t.string :start
      t.string :end
      t.string :imagebox
      t.integer :position
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
