Rails.application.routes.draw do
  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    resources :genres, only:[:create, :edit, :index, :update]
    #get 'genres' => 'genres#index'
    #post 'genres/create'
    #get 'genres/edit'
    #get 'genres/update'
  end
  namespace :admin do
    resources :items, except: [:destroy]
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/create'
    get 'orders/thanks'
    get 'orders/confirm'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/empty'
    get 'cart_items/create'
  end
  namespace :public do
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
