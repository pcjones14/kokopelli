Family::Application.routes.draw do 

  match "learning_center/show.:id", to: 'learning_center#show'

  get "learning_center/index"
  get "learning_center/show"
  get "learning_center/search"
  get "static/index"
  get "static/article"
  get "static/mission"
  get "static/values"
  get "static/staff"
  get "static/privacy_practice"
  get "static/privacy_policy"
  get "static/terms_of_use"
  get "static/disclaimer"
  get "static/contact"
  get "static/legal"
  get "static/quote"
  get "static/newsletter"

  match "static/contact" => "static#submit_contact", :via => :post
  match "static/quote" => "static#submit_quote", :via => :post

  get "articles/delete_image"
  get "articles/delete_promo"

  resources :articles

  get "users/index"
  get "users/login"
  get "users/destroy_session"
  get "users/edit_password"
  post "users/update_password"

  resources :users

  match "users/login" => "users#login_attempt", :via => :post
  match "login" => "users#login"

  root :to => 'static#index'

  # match '*a', :to => 'errors#routing'

end
