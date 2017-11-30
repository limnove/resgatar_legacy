# db/migrate/*_create_span_networks.rb

class CreateSpanNetworks < ActiveRecord::Migration
  def change
    create_table :span_networks do |t|
      t.string :slug, unique: true, index: true
      t.string :title
      t.string :path
      t.string :namepath
      t.integer :position
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
