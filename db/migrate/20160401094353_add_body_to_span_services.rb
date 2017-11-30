class AddBodyToSpanServices < ActiveRecord::Migration
  def change
    add_column :span_services, :body, :text
  end
end
