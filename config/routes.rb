Rails.application.routes.draw do

root to: "public/homes#top"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: 'public' do
    get "/orders/comfirmation" => "orders#comfirmation"
    post "/orders/comfirmation" => "orders#comfirmation"
    get "/orders/completion" => "orders#completion"
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :items, only: [:index, :show]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as:"destroy_all_cart_items"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    get "/customers" => "customers#show"
    get "/customers/information/edit" => "customers#edit"
    patch "/customers/information" => "customers#update"
    get "/customers/comfirmation" => "customers#comfirmation"
    patch "/customers/withdraw" => "customers#withdraw"
    get "/about" => "homes#about"
  end
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    get "/" =>"homes#top"
  end

#顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

#管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

end
