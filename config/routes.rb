Rails.application.routes.draw do
  resources :users

  resources :proposals do
    resources :experiments
  end

  # get '/proposals/:proposal_id' => 'proposals#show', as: 'proposal'
  get '/proposals/:proposal_id/experiments/:experiment_id' => 'experiments#show', as: 'experiment'


  post '/proposals/:proposal_id/comments' => 'comments#create', as: 'proposal_comments'
  post '/proposals/:proposal_id/experiments/:experiment_id/comments' => 'comments#create', as: 'experiment_comment'

  get 'sessions/new'

  post 'sessions/create'

  get 'sessions/destroy'

  root 'proposals#index'

end
