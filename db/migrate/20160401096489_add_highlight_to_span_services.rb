class AddHighlightToSpanServices < ActiveRecord::Migration
  def change
    add_column :span_services, :highlight, :boolean
  end
end
