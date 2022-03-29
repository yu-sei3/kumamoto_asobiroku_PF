Rails.application.routes.draw do
  # 会員用
  # URL /end_users/sign_in ...
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # ゲスト用
  # URL /public/session/guest_sign_in
  devise_scope :end_user do
    post 'public/session/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # HomesControlle
  root to: "homes#top"
  get "home/about" => "homes#about"
  get "unsubscribe/:id" => "homes#unsubscribe", as: "confirm_unsubscribe"
  patch ":id/withdraw/:id" => "homes#withdraw", as: "withdraw_end_user"
  resources :maps, only: [:index, :create, :destroy]

  # ContactsController
  resources :contacts, only: [:new, :create]

  # Public/ ...Controller
  scope module: :public do
    resources :end_users, only: [:index, :show, :edit, :update] do
      member do
        get :follows, :followers
      end
      resource :relationships, only: [:create, :destroy]
    end
    resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :genres, only: [:show]
  end

  # admin/ ...Controller
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :end_users, only: [:index, :show, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end