Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :users, only: [:create, :update]
      resources :stations, only: [:index] do
        collection do
          get 'search'
        end
      end
    end
  end
end
