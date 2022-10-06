Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: { 
    sessions: 'users/sessions',
    registrations: 'users/registrations'
 }
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  # resources :homes
  resources :users do
  member do
    get 'users/approve', to: 'users#approve'
  end
end
  resources :posts do
     resources :comments
     member do
      get 'posts/approve', to: 'posts#approve' 
     end
  end

end
