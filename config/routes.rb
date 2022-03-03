Rails.application.routes.draw do
  devise_for :members, skip:[:password],controllers: {
    registrations: "public/registrations",
    session: "public/sessions"
  }
  namespace :public do
   root to: "homes#top"
   resources :members 
    resource :members, only:[:edit]
   resources :projects#destroyはアドミンだけにする？
   get "search" => "searches#search"
  end
  
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
