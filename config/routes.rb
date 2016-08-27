Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :event_groups, except: [:new, :edit]
  end
end
