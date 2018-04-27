Rails.application.routes.draw do
  root 'sayings#new'
  resources :sayings, except: [:index, :destroy], path: '/'
end
