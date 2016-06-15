Rails.application.routes.draw do


    get 'signup' => 'teachers#new'
    post 'teachers/create'
    get 'sessions/new'

    resources :navigation, only: [:index] do
        get 'documents', on: :member
    end

    resources :documents
    resources :ratings
    resources :teachers do
        resources :documents
    end

    get 'welcome/index'
    root 'welcome#index'

    get 'typeahead/:query' => 'documents#typeahead'

    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    get 'logout' => 'sessions#destroy'
end
