class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |f|
      f.integer :recipe_id
      f.integer :user_id
    end

  end
end
