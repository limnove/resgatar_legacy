# db/migrate/*_create_span_subscribers.rb

class CreateSpanSubscribers < ActiveRecord::Migration
  def change
    create_table :span_subscribers do |t|
      t.string :slug, unique: true, index: true
      t.string :email, unique: true

      t.timestamps null: false
    end
  end
end
