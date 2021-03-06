Rails.application.routes.draw do
  root to: "static_pages#root"

  namespace :api, defaults: {format: :json} do
    resources :tasks, only: [:create, :destroy, :update, :index, :show] do
      collection do
        get 'today'
        get 'tomorrow'
        get 'week'
        get 'completed'
      end
    end
    patch '/tasks/:id/images', to: 'tasks#remove_image'
    resource :session, only: [:show, :create, :destroy]
    resources :users, only: [:show, :create]
    resources :searches, only: [:index]
    resources :lists, only: [:create, :destroy, :update, :index, :show]
    resources :locations, only: [:create, :destroy, :update, :index, :show]
    get '/lists/:id/tasks', to: 'tasks#list'
    get '/locations/:id/tasks', to: 'tasks#location'
  end

  get "auth/facebook/callback", to: "omniauth#facebook"
end
