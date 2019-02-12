Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :articles
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # get 'articles', to: 'articles#show'
  # get 'articles/new', to: 'articles#new'
  # get 'articles/edit', to: 'articles#edit'
  # get 'articles/delete', to: 'articles#delete'

end
