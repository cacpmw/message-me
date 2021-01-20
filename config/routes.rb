Rails.application.routes.draw do

  get 'session/create'
  root 'chatroom#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
