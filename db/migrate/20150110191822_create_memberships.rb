class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :group :null => :false
      t.references :user, :null => :false

      t.timestamps
    end
    add_index :memberships, [:group_id, :user_id]
  end
end
