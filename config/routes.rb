Rails.application.routes.draw do
  resources :restaurants, only: [:index, :create, :show, :new, :update, :destroy]
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: 'edit_restaurant'
end
