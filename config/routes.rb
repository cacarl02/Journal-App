Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"\
  resources :categories do
    resources :tasks
  end
  get '/signin' => 'auth#signin'
  get '/signup' => 'auth#signup'
  post 'signin' => 'auth#new_session'
  post '/signup' => 'auth#new_account'
  delete '/logout' => 'auth#logout'
end
