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
        member do
          get 'add_level' => 'teachers#add_level'
          get 'delete_level' => 'teachers#delete_level'

          get 'add_subject' => 'teachers#add_subject'
          get 'delete_subject' => 'teachers#delete_subject'
        end
    end

    get 'welcome/index'
    root 'welcome#index'

    get 'typeahead_doc/:query' => 'documents#typeahead_document'
    get 'typeahead_tag/:query' => 'documents#typeahead_tag'

    get 'documents/bytag/:tag' => 'documents#by_tag'

    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    get 'logout' => 'sessions#destroy'
end
