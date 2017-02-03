Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'content_conversation/index'

	get 'manage_access/index'

	get 'manage_user_account/index'

	get 'printhouse_setup/index'

	get 'publisher_setup/index'

	get 'publishers/search'

	get 'reports/index'

	resource :publishers
end
