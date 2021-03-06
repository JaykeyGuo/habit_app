Rails.application.routes.draw do
  devise_for :users
  resources :habit_lists do
    resources :record_days do
      member do
        patch :complete
      end
    end

    resources :habit_periods
  end
  root "posts#index"

  resources :categories

  resources :posts
end
