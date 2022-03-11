class ShoppingListsController < ApplicationController
  def index
    @recipes = current_user.recipes.includes(:recipe_foods).where(public: true)
  end
end
