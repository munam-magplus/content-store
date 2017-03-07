Rails.application.routes.draw do

  devise_for :users
  get 'end_user/search'

  get 'end_user/new'

  get 'end_user/create'

  get 'site_settings/site_setting/index'

  get 'admin_user/search'

    get 'admin_user/new'

  resources :csretailers do
    collection do 
      get 'search'
    end
  end

  get 'institution/result'

  resources :institution_user,:institution,:access_tokens,:campaigns,
            :publishers,:license_groups, :licenses,:subscriptions, :subject_groups  do 
    collection do 
      get 'search'
      get 'metadata_sheet'
      get 'search_result'
    end
  end

  post 'publishers/create'
  
  resources :journals do
    collection do
      get 'index'
      get 'search'  
      get 'upload_article_metadata'
      get 'search_article'
      get 'new_article'
    end
  end

  get 'journals/create'
  get 'journals/new'

  resources :books do
    collection do
      get 'index'
      get 'create'
      get 'search'
      get 'metadata_sheet'
      get 'onix_input'
      get 'onix_supp_sheet'
    end
  end

  resources :content_conversation do
    collection do 
  		get 'content_history'
    	get 'index_content'
    	get 'qa_check'
    	get 'update_status'
    	get 'uploaded_errors'
    end
  end

  resources :countries, only: [:index, :show]

  resources :reports, :printhouse_setup, :manage_access, 
            :manage_user_account, :publisher_setup, :end_user, only: [:index]

<<<<<<< HEAD
  resources :promo_codes, :users 

  resources :sessions, only: [:new, :create, :destory]

  match '/signup',  to: 'users#new', 			via: 'get'
  match '/signin',  to: 'sessions#new', 			via: 'get'
  match '/signout', to: 'sessions#destroy', 	via: 'delete'
=======
  resources :promo_codes, :cdp_users 
>>>>>>> e19792cb2383f4529f90fb24c1aafe41939e61e1
 
  root 'csretailers#index'
end
