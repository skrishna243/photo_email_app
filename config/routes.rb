Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/students", to: "students#index"

  root "students#new"
  
  resources :students do
    collection do
      get :student_creation
    end
  end


end
