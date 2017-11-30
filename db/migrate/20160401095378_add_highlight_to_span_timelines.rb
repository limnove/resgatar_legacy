class AddHighlightToSpanTimelines < ActiveRecord::Migration
  def change
    add_column :span_timelines, :highlight, :boolean
  end
end
