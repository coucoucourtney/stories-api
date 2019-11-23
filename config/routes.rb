Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :stories, only: [:show, :index, :destroy, :create] do
    resources :comments, only: [:new, :create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stories, only: [ :index, :show, :update, :create, :destroy ]
    end
  end
end
