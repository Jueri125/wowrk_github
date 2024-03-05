Rails.application.routes.draw do

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, only: [:update, :index, :show, :edit,]
    resources :orders, only: [:show, :update]
  end

  namespace :public do
    get '/' => 'homes#top'
    get '/about' => 'homes#about'
  end


  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  scope module: :public do
    get 'customers/edit' => 'customers#edit'
  end

    devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    patch 'customers/update' => 'customers#update'
    # :customers, only: [:edit, :update, :show]
    get "customers/check" => "customers#check", as: "coustomer_check"
    patch "customers/withdrawal" => "customers#withdrawal", as: "withdrawal"
    delete "/cart_items/destroy_all" => "cart_items#destroy_all", as: "destroy_all_cart_items"
    resources :cart_items, only: [:create, :destroy, :update, :index,]
    post "/orders/check" => "orders#check", as: "order_check"
    get "/orders/done" => "orders#done", as: "done"
    resources :items, only: [:show, :index, :update]
    resources :orders, only: [:new, :create, :update, :index, :show]
    resources :genres
  end









  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: 'homes#top'
end
