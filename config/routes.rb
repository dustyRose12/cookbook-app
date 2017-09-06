Rails.application.routes.draw do

  get '/' => 'recipes#index' #this makes a shortcut so you dont have to type recipes every time on the url.
  get '/recipes' => 'recipes#index' #URL is recipes, action is index

  get '/recipes/new' =>  'recipes#new' #always put new before :id, otherwise it thinks you're trying to pass new as an id
  post '/recipes' =>  'recipes#create'

  get '/recipes/:id' => 'recipes#show' #URL is recipes with ID, action is show to show a specific one

  get '/recipes/:id/edit' => 'recipes#edit'
  patch '/recipes/:id' => 'recipes#update'

  delete '/recipes/:id' => 'recipes#destroy'


end
