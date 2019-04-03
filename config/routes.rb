Rails.application.routes.draw do
  get 'sessions/create'
  resources :posts, constraints: { id: /\d+/ }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
end
