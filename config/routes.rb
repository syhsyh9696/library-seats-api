Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'rooms#index'
  root 'welcome#index'

  resources :rooms, only:[:index, :show] do
    resources :seats, only: [:index, :show]
  end

  resources :logs, only:[:index, :show]

  resources :tasks do
    collection do
      get 'checkin'
    end
  end

  mount API::Test => '/api'
  mount API::Library => '/api'

  get 'update_crontab', to: 'crontab#update_crontab_file'
end
