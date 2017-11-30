class AddBodyToSpanTimelines < ActiveRecord::Migration
  def change
    add_column :span_timelines, :body, :text
  end
end
