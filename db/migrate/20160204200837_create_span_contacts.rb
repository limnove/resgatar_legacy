# db/migrate/*_create_span_contacts.rb

class CreateSpanContacts < ActiveRecord::Migration
  def change
    create_table :span_contacts do |t|
      t.string :slug, unique: true, index: true
      t.string :title
      t.string :name
      t.string :surname
      t.string :address
      t.string :country
      t.string :city
      t.string :postcode
      t.string :fax
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :path
      t.string :namepath
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
