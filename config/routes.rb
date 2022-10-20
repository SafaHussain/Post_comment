Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
 }
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  # resources :homes
  resources :users do
  member do
    post 'users/approve', to: 'users#approve'
  end
  collection do
  get 'users/calculator', to: 'users#calculator'
  end
end
  resources :posts do
     resources :comments
     member do
      post 'posts/approve', to: 'posts#approve' 
     end
  end

end
