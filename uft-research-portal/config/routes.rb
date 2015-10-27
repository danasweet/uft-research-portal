Rails.application.routes.draw do
  resources :users

  get 'sessions/new'

  post 'sessions/create'

  get 'sessions/destroy'

end
