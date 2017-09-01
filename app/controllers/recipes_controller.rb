class RecipesController < ApplicationController
  # def one_recipe_action
  #   @recipe = Recipe.first
  #   render 'one_recipe_page.html.erb'
  # end

  # def all_recipes_action
  #   @recipes = Recipe.all
  #   render 'all_recipes_page.html.erb'
  # end

  def index
    @recipes = Recipe.all
  end

  def new

  end

  def create
    recipe = Recipe.new(
                                    title: params[:title],
                                    chef: params[:chef],
                                    ingredients: params[:ingredients],
                                    directions: params[:directions]
                                    )
    recipe.save
  end

  def show
    #matches the /recipes/:id url param
    @recipe = Recipe.find(params[:id])
  end

end
