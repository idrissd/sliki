class CreateTransitions < ActiveRecord::Migration
  def change
    create_table :transitions do |t|
      t.references :thing, :null => :false
      t.string :from_state, :null => :false
      t.string :to_state, :null => :false
      t.string :on_event, :null => :false

      t.timestamps
    end
    add_index :transitions, :thing_id
  end
end
