Rails.application.routes.draw do

  get 'answers/new'
  get 'answers/edit'
  get 'answers/index'
  get 'questions/new'
  get 'questions/edit'
  get 'questions/index'
  #DEVISE
  devise_for :users

  #PAGES
  root to: 'pages#horta'
  get '/portfolio', to: 'pages#portfolio'
  get '/location', to: 'pages#location'

  resources :photos, only: [:create, :destroy]
  resources :leads, only: :create
  
  #EASIER ROUTE FOR ADMIN USERS
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end
  
  # HOMEPAGE
  get '/chat', to: "pages#chat"
  
  # ADMIN
  
  scope :admin do
    get '/', to: 'admin#control_panel', as: 'admin'
    resources :customers, except: :show
    resources :answers
    resources :questions do
      post '/associate_answer', to: 'questions#associate_answer'
      resources :answers, only: [] do
        delete '/remove_answer', to: 'questions#remove_answer'
      end
    end
  end

  # API

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'get_question/:id', to: 'chats#get_question'
      resources :staff, only: :index
    end
  end

end
