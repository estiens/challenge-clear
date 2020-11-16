Rails.application.routes.draw do
  root "home#index"
  get "load-test", to: "home#load_test"
end
