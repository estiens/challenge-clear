Rails.application.routes.draw do
  get 'libraries/search'
  get 'libraries/show'
  root 'libraries#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
