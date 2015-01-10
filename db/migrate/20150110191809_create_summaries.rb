class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.references :thing, index: true, :null => :false
      t.references :parent_control, index: true
      t.string :name, :null => :false
      t.string :type, :null => :false, :default => "DataTableSummary"
      t.integer :position, :default => 0
      t.text :view

      t.timestamps
    end
  end
end
