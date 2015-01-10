class AddSlugToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :slug, :string
    add_index :summaries, :slug
  end
end
