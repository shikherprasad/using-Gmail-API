Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mails#login'
  get 'mails/gmails' => 'mails#gmails'
  get 'mails/body' => 'mails#body'
  get 'auth/:provider/callback', to: 'sessions#create'
  resources :sessions, only: [:create, :destroy]
  post 'signout', to: 'sessions#destroy', as: 'signout'
  get 'signout', to: 'sessions#destroy'

end
