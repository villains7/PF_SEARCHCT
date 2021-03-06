Rails.application.routes.draw do
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions",
  }
  namespace :admin do
    get 'searches/search'
    get 'top' => 'searches#index'
    resources :projects, only: [:show, :destroy]
    resources :events,only: [:index, :new, :create]
  end

  # 社員用
  devise_for :members, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions",
  }

  # ログイン前トップページの表示
  root to: "homes#top"

  scope module: :public do
    get "top" => "projects#index"
    get "search" => "searches#index"
    get "result" => "searches#search"
    resources :event, only: [:index]
    resources :members, only: [:update, :show, :edit]
    resources :projects, only: [:new, :index, :create, :edit, :show, :update] do
      resource :thanks, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
