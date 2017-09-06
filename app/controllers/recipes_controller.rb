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
    #typing Recipe.create is the same as typing Recipe.new(blabla) + putting recipe.save at the bottom
  end

  def show
    #matches the /recipes/:id url param
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])

    recipe.assign_attributes(
                                          title: params[:title],
                                          chef: params[:chef],
                                          ingredients: params[:ingredients],
                                          directions: params[:directions]
                                    )

    # recipe.title = params[:title].  You can use assign_attributes method instead of typing all this
    # recipe.chef = params[:chef]
    # recipe.ingredients = params[:ingredients]
    # recipe.directions = params[:directions]

    recipe.save

    #recipe.update is the same as using recipe.assign_attributes(blabla) + typing recipe.save
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
  end

end
