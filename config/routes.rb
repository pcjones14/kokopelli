Family::Application.routes.draw do

  get "users/login"
  get "users/edit"
  get "users/destroy_session"
  get "front/index"
  get "front/show"
  get "front/search"
  get "static_pages/index"
  get "static_pages/article"
  get "static_pages/mission"
  get "static_pages/values"
  get "static_pages/staff"
  get "static_pages/privacy_practice"
  get "static_pages/privacy_policy"
  get "static_pages/terms_of_use"
  get "static_pages/disclaimer"
  get "static_pages/contact"
  get "static_pages/legal"
  get "static_pages/quote"
  get "static_pages/newsletter"

  match "static_pages/contact" => "static_pages#submit_contact", :via => :post

  match "users/login" => "users#login_attempt", :via => :post
  match "login" => "users#login"

  get "articles/delete_image"
  get "articles/delete_promo"
  resources :articles

  root :to => 'static_pages#index'

  match '*a', :to => 'errors#routing'

end
