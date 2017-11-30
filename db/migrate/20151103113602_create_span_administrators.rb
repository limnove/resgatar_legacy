# db/migrate/*_create_span_administrators.rb

class CreateSpanAdministrators < ActiveRecord::Migration
  def change
    create_table :span_administrators do |t|
      t.string :slug, unique: true, index: true
      t.string :email, unique: true
      t.string :username, unique: true
      t.string :name
      t.string :surname
      t.string :password_digest
      t.string :authentication_token
      t.string :reset_password_token, unique: true
      t.datetime :reset_password_sent_at
      t.boolean :sudo, default: false

      t.timestamps null: false
    end
  end
end
