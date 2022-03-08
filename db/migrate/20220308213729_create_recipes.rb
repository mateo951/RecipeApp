class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :preparationTime
      t.integer :cookingTime
      t.string :description
      t.boolean :public

      t.timestamps
    end
    add_column :recipes, :user_id, :bigint
    add_foreign_key :recipes, :users, column: :user_id
    add_index :recipes, :user_id
  end
end
