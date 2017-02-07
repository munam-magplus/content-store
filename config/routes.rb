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


  get 'promo_codes/search'

  get 'promo_codes/create'

  get 'promo_codes/new'

  get 'promo_codes/index'

  get 'access_tokens/search'

  get 'access_tokens/create'

  get 'access_tokens/new'

  get 'access_tokens/index'

  get 'campaigns/search'

  get 'campaigns/create'

  get 'campaigns/new'

  get 'campaigns/index'

  get 'license_groups/search'

  get 'license_groups/create'

  get 'license_groups/new'

  get 'license_groups/index'

  get 'licenses/search'

  get 'licenses/create'

  get 'licenses/new'

  get 'licenses/index'

  get 'subscriptions/search'

  get 'subscriptions/create'

  get 'subscriptions/new'

  get 'subscriptions/index'

  get 'subject_groups/create'

  get 'subject_groups/search'
    get 'subject_groups/index'

  get 'subject_groups/metadata_sheet'

  get 'journals/new'
   get 'journals/index'

  get 'journals/search'

  get 'journals/upload_article_metadata'

  get 'journals/search_article'

  get 'journals/new_article'

  get 'books/create'

  get 'books/search'

    get 'books/index'
    get 'books/metadata_sheet'
    get 'books/onix_input'
    get 'books/onix_supp_sheet'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get 'content_conversation/index'
		get 'content_conversation/content_history'
	get 'content_conversation/index_content'
	get 'content_conversation/qa_check'
	get 'content_conversation/update_status'
	get 'content_conversation/uploaded_errors'
  get 'reports/index'

  get 'printhouse_setup/index'

  get 'manage_access/index'

  get 'content_conversation/index'

  get 'manage_user_account/index'

  get 'publisher_setup/index'

  get 'publishers/search'

  get 'retailers/index'

	get 'publishers/search'
		get 'publishers/index'

  get 'retailers/search'

  get 'publishers/index'

	resource :publishers
	resources :cdp_users
  resources :sessions, only: [:new, :create, :destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  match '/signup',  to: 'cdp_users#new', 			via: 'get'
  match '/signin',  to: 'sessions#new', 			via: 'get'
  match '/signout', to: 'sessions#destroy', 		via: 'delete'
  get 'end_user/index'

  #resources :sessions, only: [:new, :create, :destroy]
  resources :publishers

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
