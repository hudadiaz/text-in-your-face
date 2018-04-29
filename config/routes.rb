Rails.application.routes.draw do
  root 'sayings#index'
  resources :sayings, except: [:destroy], path: '/'
end
