Rails.application.routes.draw do
  resources :forums
  root to: "forums#index"

  mount ActionCable.server => '/cable'

end
