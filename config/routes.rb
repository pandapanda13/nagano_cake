Rails.application.routes.draw do
  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only:[:create, :edit, :index, :update]
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

  scope module: 'public' do
    get 'customers/mypage', to: 'customers#show'
    get 'customers/edit', to: 'customers#edit'
    patch 'customers/update'
    get 'customers/unsubscribe'
    patch 'customers/withdraw'
  end
  #namespace :public do
  scope module: 'public' do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
  end

  scope module: 'public' do
    get 'items', to: 'items#index'
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
