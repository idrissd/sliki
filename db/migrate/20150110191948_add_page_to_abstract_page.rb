class AddPageToAbstractPage < ActiveRecord::Migration
  def change
    add_column :abstract_pages, :topic_id, :integer, :null => :false
  end
end
