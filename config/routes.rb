Rails.application.routes.draw do

  resources :csretailers do
    collection do 
      get 'search'
    end
  end


  resources :institution_user,:institution,:access_tokens,:campaigns,
            :publishers,:license_groups, :licenses,:subscriptions  do 
    collection do 
      get 'search'
    end
  end

  resources :subject_groups do
    collection do
      get 'search'
      get 'metadata_sheet'
    end
  end

  get 'subject_groups/create'
  get 'subject_groups/new'

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

  get 'books/create'

  resources :content_conversation do
    collection do 
  		get 'content_history'
    	get 'index_content'
    	get 'qa_check'
    	get 'update_status'
    	get 'uploaded_errors'
    end
  end

  get 'printhouse_setup/create'
  get 'printhouse_setup/print_order'
  get 'printhouse_setup/search'

  resources :countries, only: [:index, :show]

  resources :reports, :printhouse_setup, :manage_access, 
            :manage_user_account, :publisher_setup, :end_user, only: [:index]

  resources :promo_codes, :cdp_users 

  resources :sessions, only: [:new, :create, :destory]

  match '/signup',  to: 'cdp_users#new', 			via: 'get'
  match '/signin',  to: 'sessions#new', 			via: 'get'
  match '/signout', to: 'sessions#destroy', 	via: 'delete'
 
  root 'sessions#new'
end