Rails.application.routes.draw do
  get 'institution_user/index'

  get 'institution_user/show'

  get 'institution_user/new'

  get 'institution_user/create'

  get 'institution_user/search'

  get 'institution/index'

  get 'institution/show'

  get 'institution/new'

  get 'institution/create'

  get 'institution/search'

  get 'countries/index'

  get 'countries/show'

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
