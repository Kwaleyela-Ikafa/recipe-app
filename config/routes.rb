Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root :to => 'foods#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :users do
    resources :foods
  end

  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
