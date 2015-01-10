class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :topic, :null => :false
      t.references :user, :null => :false

      t.timestamps
    end
    add_index :subscriptions, [:topic_id, :user_id]
  end
end
