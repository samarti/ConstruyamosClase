Rails.application.routes.draw do

    get 'documents/favorites' => 'documents#favorites'

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

    get 'typeahead_doc/:query' => 'documents#typeahead_document'
    get 'typeahead_tag/:query' => 'documents#typeahead_tag'

    get 'documents/bytag/:tag' => 'documents#by_tag'

    get 'addfavorite/:id' => 'teachers#add_favorite'


    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    get 'logout' => 'sessions#destroy'
end
