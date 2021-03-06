Rails.application.routes.draw do
  get 'sessions/new'

  root 'pages#index'

  resources :users
  resources :blog_posts

  get '/about', to: 'pages#about'
  get '/sample_blog_post', to: 'pages#sample_blog_post'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/user_profile', to: 'sessions#show'
  get '/user_profile/edit', to: 'sessions#edit'
  patch '/user_profile', to: 'sessions#update'
  get '/recent_blog', to: 'pages#recent_blog'
  get '/dashboard', to: 'pages#dashboard'
  get '/import', to: 'blog_posts#upload'
  post '/import', to: 'blog_posts#import'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
