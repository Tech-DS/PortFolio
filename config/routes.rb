Rails.application.routes.draw do
 get 'homes/top'
 root "homes#top"
 get 'home/about' => 'homes#about', as: 'about'

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

   scope module: :seniors do
     resources :posts, only: [:index, :new, :create, :show, :edit, :destroy]
     resources :post_comments, only: [:create, :destroy]

    root to: 'events#index'
     resources :events
  end



end
