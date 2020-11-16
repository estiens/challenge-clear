Rails.application.routes.draw do
  root "home#index"
  get "load-test", to: "home#load_test"
  get "stats", to: "home#stats"
  get "stats-common", to: "home#common_queries"
  get "stats-language", to: "home#language_count"
end
