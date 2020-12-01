class AddTimestampsToArticles < ActiveRecord::Migration[6.0]
  #add column to existing table, attribute name, datatype
  def change
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
