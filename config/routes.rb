Rails.application.routes.draw do

  root to: 'messages#new'

  resources :messages, only: %w(new create)

end
