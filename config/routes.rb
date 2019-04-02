Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to=>"root#top"

  get "top"=>"root#top", as: "top"
  get "about"=>"root#about", as: "about"

  resources :post_informations
  resources :post_blogs
  resources :post_images
  resources :users
# 自分で定義
  # get "users/edit/all"=>"users#edit_all", as:"edit_all_users"
  # patch "users/update/all"=>"users#update_all", as:"update_all_users"

  get "numbers"=>"users#numbers", as:"numbers"
  resources :post_applications do
  	resources :post_application_responses
  end
end
