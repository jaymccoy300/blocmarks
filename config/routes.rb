Rails.application.routes.draw do
  get 'likes/index'

  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  devise_for :users
  resources :users, only: [:show]

  get 'about' => 'welcome#about'

  root "welcome#index"
end
