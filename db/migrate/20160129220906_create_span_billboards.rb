# db/migrate/*_create_span_billboards.rb

class CreateSpanBillboards < ActiveRecord::Migration
  def change
    create_table :span_billboards do |t|
      t.string :slug, unique: true, index: true
      t.string :title
      t.text :description
      t.string :path
      t.string :namepath
      t.string :imagebox
      t.integer :position
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
