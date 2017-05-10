Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :products do
    collection do
      get :search
    end
    member do
      post :add_to_cart
      post :collect
      post :remove
      post :upvote
      post :downvote
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      get  :alipay
      get  :wechatpay
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end

  resources :goods_collections



end
