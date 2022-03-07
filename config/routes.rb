Rails.application.routes.draw do
  # 会員用
  # URL /end_users/sign_in ...
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  # HomesControlle
  root to: "homes#top"
  get "home/about" => "homes#about"

  # Controller/Public/ ...
  scope module: :public do
    resources :end_users, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
