Rails.application.routes.draw do
  resources :events
  resources :list do
    member do
      get 'show'
      get 'index'
    end

    collection do
      get 'add_entrant'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
