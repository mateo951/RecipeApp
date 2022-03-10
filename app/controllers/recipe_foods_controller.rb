class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show
  end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @food = Food.find(params[:food_id])
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params, food: @food)

      if @recipe_food.save
         redirect_to recipe_path(@recipe), notice: "Recipe food was successfully created."
      else
         redirect_to new_recipe_food_url, notice: "Recipe food was not created."
      end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    redirect_to recipe_foods_url, notice: "Recipe food was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_food
      @recipe_food = RecipeFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_food_params
      params.require(:recipe_food).permit(:quantity)
    end
end
