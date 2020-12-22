Rails.application.routes.draw do
 get 'homes/top'
 root "homes#top"
 get 'home/about' => 'homes#about', as: 'about'
 get 'home/option_senior' => 'homes#option_senior', as: 'option_senior'
 get 'home/option_junior' => 'homes#option_junior', as: 'option_junior'

 devise_for :seniors, controllers: {
   sessions:      'seniors/sessions',
   passwords:     'seniors/passwords',
   registrations: 'seniors/registrations'
 }
 devise_for :juniors, controllers: {
   sessions:      'juniors/sessions',
   passwords:     'juniors/passwords',
   registrations: 'juniors/registrations'
 }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   resources :posts, only: [] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
   end
   scope module: :seniors do
    resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :timelines, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :profiles, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    root to: 'events#index'
    resources :events
   end

   namespace :juniors do
    resources :seniors, only: [:index, :show] do
     collection do
      get :search
     end
     resource :follow_requests, only:[:create, :destroy]
     end
    resources :posts, only: [:index, :show, :edit, :update, :destroy]
   end

   namespace :seniors do
    get '/junior_follows' => 'junior_follows#index', as: 'seniors_junior_junior_follows'
    resources :junior_follows, only:[:destroy, :show]
    get 'juniors/follow_requests/' => 'follow_requests#index'
    resources :juniors, only: [:show, :edit, :update] do
      post '/follow_requests/:id' => 'follow_requests#allow', as: 'allow'
      resources :follow_requests, only:[:show, :destroy]
    end
   end

end
