require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq"

  root to: 'messages#new'

  resources :messages, only: %w(new create)

end
