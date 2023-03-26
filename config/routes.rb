Rails.application.routes.draw do
  resources :tasks, defaults: {format: :json}
  get 'home/index'
  get 'tasks/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
