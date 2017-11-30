# db/migrate/*_create_span_biographies.rb

class CreateSpanBiographies < ActiveRecord::Migration
  def change
    create_table :span_biographies do |t|
      t.string :slug, unique: true, index: true
      t.string :title
      t.text :description
      t.text :body
      t.string :imagebox
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
