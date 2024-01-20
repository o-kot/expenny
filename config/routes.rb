Rails.application.routes.draw do
  devise_for :users
  root 'index#index'
  resources :receipts
  resources :purchased_item
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'receipt_form/index' => 'receipt_form#index', :as => :receipt_form_path
  get 'receipt_form/shop' => 'receipt_form#shop', :as => :receipt_form_shop_form_path
  get 'receipt_form/products' => 'receipt_form#products', :as => :receipt_form_products_form_path
  # Defines the root path route ("/")
  # root "articles#index"
end
