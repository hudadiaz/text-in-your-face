Rails.application.routes.draw do
  root 'phrases#new'
  resources :phrases, except: [:index, :destroy], path: '/'
end
