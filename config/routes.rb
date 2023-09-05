Rails.application.routes.draw do
  root "gnar/employee_assets#index"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new", as: :new_user_session
    get "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  if Rails.env.development?
    get :dev_sign_in, to: "dev_sign_in#index", as: :dev_sign_in
  end

  namespace :gnar do
    resources :employee_assets
    resources :users do
      resources :employee_assets
    end
  end
end
