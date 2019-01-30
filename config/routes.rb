Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  resources :articles
  # get 'articles', to: 'articles#show'
  # get 'articles/new', to: 'articles#new'
  # get 'articles/edit', to: 'articles#edit'
  # get 'articles/delete', to: 'articles#delete'

end
