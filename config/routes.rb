Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Root path of the application
  root 'index#index'

  # Resourceful routes
  resources :receipts
  resources :purchased_items # Pluralized for convention

  # Custom routes for receipt forms
  get 'receipt_form/index', to: 'receipt_form#index', as: :receipt_form
  get 'receipt_form/shop', to: 'receipt_form#shop', as: :receipt_form_shop
  get 'receipt_form/products', to: 'receipt_form#products', as: :receipt_form_products

  # Custom route for charts
  get 'charts', to: 'dcharts#index', as: 'charts'

  # Other routes can be defined here

  # Example of a commented root path (optional to keep)
  # root "articles#index"
end
