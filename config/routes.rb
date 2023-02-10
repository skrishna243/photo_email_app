Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    root "devise/sessions#new"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "/students", to: "students#index"

  get 'landing', to: 'landings#landing'

resources :schools do
  resources :students 
end

resources :events do
  resources :event_members 
end

resources :reports do
  collection do
      get :event_member
  end
end

end
