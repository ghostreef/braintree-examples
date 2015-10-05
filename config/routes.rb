Rails.application.routes.draw do
  get 'examples/simple_form'
  post 'examples/simple_checkout'

  get 'examples/custom_form'
  post 'examples/custom_checkout'

  root 'examples#index'

  resources :customers
end
