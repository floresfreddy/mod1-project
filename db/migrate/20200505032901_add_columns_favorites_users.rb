class AddColumnsFavoritesUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :favorites, :string
  end
end
