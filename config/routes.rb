Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :group_events, except: [:new, :edit]
  end
end
