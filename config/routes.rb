Rails.application.routes.draw do
  devise_for :members, skip:[:passwords],controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #ログイン前トップページの表示
  root to: "homes#top"


  scope module: :public do
   get "top" => "homes#top"
   get "members/my_page" => "members#show"
   get "search" => "searches#search"
   resources :members, only:[:update]
    resource :members, only:[:edit]
   resources :projects do
     resource :thanks, only:[:create,:destroy]
     resource :comments, only:[:create,:destroy]
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
