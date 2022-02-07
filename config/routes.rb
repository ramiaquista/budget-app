Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :categories do
    resources :expenses
  end
  resources :expenses
  root "categories#index"
end
