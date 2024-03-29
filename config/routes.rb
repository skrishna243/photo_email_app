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
  collection do
    get :schools_school_search
  end
  resources :students 
end

resources :events do
  resources :event_members 
end

resources :senior_schools do
  
    member do 
       get  :upload_senior_student_data
    end
    collection do
      post :import_student_data
    end

    resources :senior_students do
      collection do
        get :student_search
        get :check_in
        get :check_out
        get :check_in_update
      end
    end
    resources :senior_student_checks do
      collection do
        get :student_checks_expand
        get :edit_student_check
        get :update_student_check
      end
    end
end

resources :slates do
  collection do
    get :slate_school_search
  end
  resources :slate_details do
    collection do
      get :slate_detail_expand
    end
  end
end
resources :reports do
  collection do
      get :event_member
  end
  collection do
      get :senior_student_report
  end
  collection do
      get :slate_detail_report
  end
end

end
