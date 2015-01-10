class CreateAbstractPages < ActiveRecord::Migration
  def change
    create_table :abstract_pages do |t|
      t.references :author, index: true, :null => :false
      t.references :parent_control, index: true
      t.string :type, :null => :false
      t.string :name, :null => :false, :unique => true
      t.string :state, :default => "new"

      t.timestamps
    end
  end
end
