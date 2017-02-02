Rails.application.routes.draw do
  get 'manage_user_account/index'

  get 'manage_access/index'

  get 'printhouse_setup/index'

  get 'publisher_setup/index'

  get 'publishers/index'

  get 'reports/index'

  get 'content_conversation/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
