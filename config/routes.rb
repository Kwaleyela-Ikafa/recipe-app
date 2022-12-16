Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root :to => 'recipes#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :foods, except: :update
  resources :recipes, except: :update do
    resources :recipe_foods
  end
  resources :users
  get 'public_recipes', to: 'recipes#public_recipes'
end
