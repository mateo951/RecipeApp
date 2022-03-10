class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show destroy]

  # GET /recipes or /recipes.json
  def index
    # @current_user = current_user
    @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    # @recipe = Recipe.find(params[:id])
    # @foods = @recipe.foods
    # @recipe_foods = @recipe.recipe_foods
    
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @current_user = current_user
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params.merge(user_id: current_user.id))

      if @recipe.save
        redirect_to recipe_url(@recipe), notice: "Recipe was successfully created."
      else
        redirect_to new_recipe_url, notice: "Recipe was not created."
      end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_url, notice: "Recipe was successfully destroyed." 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
    end
end
