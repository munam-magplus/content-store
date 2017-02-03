Rails.application.routes.draw do
  get 'reports/index'

  get 'printhouse_setup/index'

  get 'manage_access/index'

  get 'content_conversation/index'

  get 'manage_user_account/index'

  get 'publisher_setup/index'

  get 'publishers/search'

  get 'retailers/index'

  get 'retailers/search'

  get 'publishers/index'

  get 'end_user/index'

  #resources :sessions, only: [:new, :create, :destroy]
  resources :publishers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
