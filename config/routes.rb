RubyBlog::Application.routes.draw do
  root :to  => 'blog_posts#index'

  get  'post'      => 'blog_posts#show',    :as => 'post'
  get  'posts'     => 'blog_posts#index',   :as => 'posts'
  get  'new_post'  => 'blog_posts#new',     :as => 'new_post'
  get  'edit_post' => 'blog_posts#edit',    :as => 'edit_post'
  get  'del_post'  => 'blog_posts#destroy', :as => 'del_post'
  post 'like_post' => 'blog_posts#like',    :as => 'like_post'
  resources :blog_posts

  get  'sign_up' => 'users#new',   :as => 'sign_up'
  get  'authors' => 'users#index', :as => 'authors'
  get  'profile' => 'users#show',  :as => 'profile'
  post 'set_name' => 'users#set_name', :as => 'set_name'
  put  'set_name' => 'users#set_name', :as => 'set_name'
  resources :users

  get  'log_in'   => 'sessions#new',     :as => 'log_in'
  get  'log_out'  => 'sessions#destroy', :as => 'log_out'
  resources :sessions

end
