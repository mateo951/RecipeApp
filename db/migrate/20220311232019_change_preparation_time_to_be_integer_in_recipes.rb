class ChangePreparationTimeToBeIntegerInRecipes < ActiveRecord::Migration[7.0]
  def change  
    'ALTER TABLE recipes ALTER COLUMN preparation_time TYPE integer';
  end
end
