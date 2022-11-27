Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  }

  devise_scope :customer do
    post 'public/customers/guest_sign_in', to: 'public/sessions#new_guest'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  root 'public/home#top'

  namespace :admin do
    resources :customers, :only => [:index, :show, :update, :edit]
    resources :reviews, :only => [:show, :destroy]
    get 'reviews/index/:id', to: 'reviews#index', as: 'admin_reviews'
    resources :comments, :only => [:destroy]
    get 'comments/index/:id', to: 'comments#index', as: 'admin_comments'
    resources :prefectures, :only => [:new, :create, :update, :edit, :destroy]
  end

  namespace :public do
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch ':id/customers/withdraw' => 'customers#withdraw'
    put 'customers/withdraw' => 'customers#withdraw'
    resources :customers, :only => [:show, :update, :edit]
    resources :reviews, :only => [:new, :create, :show, :update, :edit, :destroy]
    get 'reviews/index/:id', to: 'reviews#index', as: 'public_reviews'
    get 'reviews/venue/search', to: 'reviews#venue_search', as: 'venue_search'
    resources :comments, :only => [:create, :update, :edit, :destroy]
    get 'comments/index/:id', to: 'comments#index', as: 'public_comments'
    resources :products do
    collection do
      get :search
    end
  end
  end
end