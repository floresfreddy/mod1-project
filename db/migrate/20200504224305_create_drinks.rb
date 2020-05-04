class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |d|
      d.string :name
      d.string :description
    end
    

  end
end
