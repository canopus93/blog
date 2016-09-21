Rails.application.routes.draw do
  root 'pages#index'

  get '/about', to: 'pages#about'
  get '/sample_blog_post', to: 'pages#sample_blog_post'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end