Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  authenticated :user do
    root "categories#index"
    resources :categories do
      resources :expenses
    end
    resources :expenses
  end

  unauthenticated :user do
    root 'categories#splash_screen', as: :unauthenticated #-> if user is not logged in
  end
end
