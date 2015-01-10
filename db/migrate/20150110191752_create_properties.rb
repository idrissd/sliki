class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :thing, index: true, :null => :false
      t.references :parent_control, index: true
      t.string :name, :null => :false
      t.string :type, :null => :false, :default => "StringProperty"
      t.integer :position, :default => 0
      t.boolean :many, :default => false
      t.boolean :required, :default => false
      t.string :matches
      t.string :restricted
      t.decimal :minimum
      t.decimal :maximum
      t.text :view

      t.timestamps
    end
  end
end
