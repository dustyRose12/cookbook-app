class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all

    sort_attribute = params[:sort] #allows to sort in a string query on the url to order by attribute
    if sort_attribute
      @recipes = @recipes.order(sort_attribute)
    end
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
    flash[:success] = "Recipe Successfully Created"
    redirect_to "/recipes/#{recipe.id}"
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
    flash[:success] = "Recipe Successfully Updated"
    redirect_to "/recipes/#{recipe.id}"

  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    flash[:warning] = "Recipe Successfully Destroyed"
    redirect_to "/recipes"
  end

end
