Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :categories
  resources :expenses
  root "categories#index"
end
