Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users

  # list item routes
  resources :list_items do
    patch 'update_status', to: 'list_items#update_status', as: "update_status", on: :member
    
    collection do
      post :filter_list_items, as: "filter"
    end
  end

  # pages controller routes
  get 'pages/home'
end
