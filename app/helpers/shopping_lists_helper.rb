module ShoppingListsHelper
  def total(ingredients)
    sum = 0
    ingredients.each do |ingredient|
      sum += ingredient.quantity * ingredient.food.price
    end
    sum
  end
end
