Bloccit::Application.routes.draw do
 

  get 'comments/new'

  get 'comments/show'

  get 'comments/index'

  devise_for :users
    resources :users, only: [:update, :show]
    resources :topics do
      resources :posts, except: [:index] do
        resources :comments, only: [:create, :destroy]
          resources :favorites, only: [:create, :destroy]
    get '/up_vote' => 'votes#up_vote', as: :up_vote
    get '/down_vote' => 'votes#down_vote', as: :down_vote
    end
  end

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
