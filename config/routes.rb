Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to=>"root#top"


  get "top"=>"root#top", as: "top"
  get "about"=>"root#about", as: "about"
  get "contact"=>"root#contact", as:"contact"
  # 例外的にrootの中に定義　名前の付け方も例外的、規則に沿ってない
  get "root/blogs/:id"=>"root#root_show", as:"root_post_blog"
  get "root/blogs"=>"root#root_index", as:"root_post_blogs"
  #以上ふたつ
  resources :post_blogs, :except=>[:show, :index]
  resources :inquiries ,:except=>[:new, :edit, :update]
  resources :post_informations
  resources :post_images, :except=>[:index]
  resources :users
# 自分で定義
  # get "users/edit/all"=>"users#edit_all", as:"edit_all_users"
  # patch "users/update/all"=>"users#update_all", as:"update_all_users"

  get "numbers"=>"users#numbers", as:"numbers"
  resources :post_applications do
  	resources :post_application_responses, :except=>[:new]
  end
end
