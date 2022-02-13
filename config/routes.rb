Rails.application.routes.draw do
  namespace :admin do
    resources :order_details, only:[:update]
  end
  namespace :admin do
    resources :orders, only:[:show, :update]
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

  scope module: 'public' do
    get 'orders/thanks'
    post 'orders/confirm'
    resources :orders, only:[:new, :create, :index, :show]
  end

  scope module: 'public' do
    delete 'cart_items/empty'
    resources :cart_items, only:[:index, :create, :update, :destroy]
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
   resources :addresses, except:[:new, :show]
  end

  scope module: 'public' do
    resources :items, only:[:index, :show]
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
