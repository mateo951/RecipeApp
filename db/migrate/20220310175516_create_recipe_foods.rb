# frozen_string_literal: true

class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.decimal :quantity

      t.timestamps
    end
    add_column :recipe_foods, :food_id, :bigint
    add_column :recipe_foods, :recipe_id, :bigint
    add_foreign_key :recipe_foods, :recipes, column: :recipe_id
    add_foreign_key :recipe_foods, :foods, column: :food_id
    add_index :recipe_foods, :recipe_id
    add_index :recipe_foods, :food_id
  end
end
