class AddKindToAbstractPage < ActiveRecord::Migration
  def change
    add_column :abstract_pages, :thing_id, :integer, :null => :false
    add_column :abstract_pages, :values, :text
  end
end
