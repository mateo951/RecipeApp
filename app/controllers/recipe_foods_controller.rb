class RecipeFoodsController < ApplicationController
  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @food = Food.find(params[:food_id])
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.new(
      quantity: params[:quantity],
      food_id: @food.id
    )

    if @recipe_foods.save
      redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully created.'
    else
      redirect_to recipe_path(@recipe), notice: 'Recipe food was not created.'
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    redirect_to recipe_recipe_path, notice: 'Recipe food was successfully destroyed.'
  end
end
