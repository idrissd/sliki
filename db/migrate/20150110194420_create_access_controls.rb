class CreateAccessControls < ActiveRecord::Migration
  def change
    create_table :access_controls do |t|
      t.integer :accessible_id, :null => :false
      t.string :accessible_type, :null => :false
      t.string :control, :default => "deny"
      t.integer :position, :default => 0
      t.references :group, :null => :false
      t.boolean :create_access, :default => false
      t.boolean :read_access, :default => false
      t.boolean :update_access, :default => false
      t.boolean :destroy_access, :default => false

      t.timestamps
    end
    add_index :access_controls, :group_id
    add_index :access_controls, [:accessible_id, :accessible_type]
  end
end
