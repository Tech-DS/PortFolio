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
end
