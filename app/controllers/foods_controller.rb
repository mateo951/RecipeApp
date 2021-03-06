class FoodsController < ApplicationController
  load_and_authorize_resource

  # GET /foods or /foods.json
  def index
    @foods = Food.all
    @foods = current_user.foods.all.includes(:recipe_foods)
  end

  # GET /foods/1 or /foods/1.json
  def show; end

  # GET /foods/new
  def new
    @food = Food.new
    @current_user = current_user
  end

  # POST /foods or /foods.json
  def create
    @food = current_user.foods.new(food_params)

    if @food.save
      redirect_to foods_url, notice: 'Food was successfully created.'
    else
      redirect_to foods_url notice: 'Food was not created.'
    end
  end

  # DELETE /foods/1 or /foods/1.json
  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to foods_url, notice: 'Food was successfully deleted.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
