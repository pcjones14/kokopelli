Family::Application.routes.draw do

  get "users/login"
  get "users/edit"
  get "users/destroy_session"
  get "front/index"
  get "front/show"
  get "front/search"
  get "static_pages/index"
  get "static_pages/article"
  get "static_pages/clinic_information"
  get "static_pages/providers"
  get "static_pages/staff"
  get "static_pages/privacy_practice"
  get "static_pages/privacy_policy"
  get "static_pages/terms_of_use"
  get "static_pages/disclaimer"

  match "users/login" => "users#login_attempt", :via => :post
  match "login" => "users#login"

  resources :articles

  root :to => 'static_pages#index'

  match '*a', :to => 'errors#routing'

end
