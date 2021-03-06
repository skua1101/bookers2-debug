Rails.application.routes.draw do
  get "searches" => "searches#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }
  root to: "homes#top"
  get "home/about"=>"homes#about"


  resources :users, only: [:index,:show,:edit,:update]do
    resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]do
    resource :favorites, only: [:create, :destroy]
     resources :book_comments, only: [:create, :destroy]
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html