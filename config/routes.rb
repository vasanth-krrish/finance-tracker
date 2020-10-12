Rails.application.routes.draw do
  devise_for :users
  get '/my_portfolio' => 'users#my_portfolio', as: "my_portfolio"
  root 'users#my_portfolio'
  get '/search_stock' => 'stocks#search', as: 'search_stock'

  get '/save_stock/:ticker' => 'stocks#save', as: 'save_stock'
  delete '/delete_stock/:id' => 'stocks#destroy', as: 'remove_stock'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
