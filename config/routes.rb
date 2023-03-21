Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"\
  resources :categories do
    resources :tasks
  end
  # get '/categories' => 'categories#index', as: 'categories_index'
  # post '/categories' => 'categories#create', as: 'categories_create'
  # get '/categories/new' => 'categories#new', as: 'categories_new'
  # get '/categories/:id' => 'categories#show', as: 'categories_show'
  # get '/categories/:id/edit' => 'categories#edit', as: 'categories_edit'
  # patch '/categories/:id' => 'categories#update', as: 'categories_update'
end
