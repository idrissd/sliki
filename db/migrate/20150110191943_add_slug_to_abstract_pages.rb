class AddSlugToAbstractPages < ActiveRecord::Migration
  def change
    add_column :abstract_pages, :slug, :string
    add_index :abstract_pages, :slug
  end
end
