class AddThingToAbstractPage < ActiveRecord::Migration
  def change
    add_column :abstract_pages, :color, :string, :default => "#CCC"
    add_column :abstract_pages, :position, :integer, :default => 0
    add_column :abstract_pages, :x, :integer, :default => 0
    add_column :abstract_pages, :y, :integer, :default => 0
  end
end
