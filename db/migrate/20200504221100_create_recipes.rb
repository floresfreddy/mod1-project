class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :drink_id
      t.integer :ingredients_id
      t.string  :instructions
    end
  end
end
