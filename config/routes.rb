Rails.application.routes.draw do
  devise_for :members, skip:[:passwords],controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  root to: "homes#top"


  scope module: :public do
   get "top" => "homes#top"
   get "search" => "searches#search"
   resources :members
    resource :members, only:[:edit]
   resources :projects do
     resource :comments,only:[:create,:destroy]
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
