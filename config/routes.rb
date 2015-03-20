Rails.application.routes.draw do
  post '/subscribe', to: 'main#create', as: :subscribe
  root to: 'main#index'
end
