Rails.application.routes.draw do

  devise_for :users
  
  get 'end_user/search'
  
  post 'subject_groups/new'

  get 'end_user/new'
  get 'journals/search'
  post 'journals/new_article'

  get 'end_user/create'

  get 'site_settings/site_setting/index'

  # get 'admin_user/search'
  # # post 'admin_user/search'

   get 'admin_user/new'
   post 'admin_user/new'
   get 'admin_user/create'
   post 'admin_user/create'
   get 'admin_user/search'
   get 'admin_user/index'
   post 'admin_user/index'

  # resources :admin_user do
  #   collection do 
  #     get 'search'
  #     get 'index'
  #     post 'index'
  #   end
  # end

  resources :retailers do
    collection do 
      get 'search'
    end
  end

  get 'institution/result'

  resources :institution_user, :institution, :access_tokens, :campaigns,
            :publishers,:license_groups, :licenses,:subscriptions, :subject_groups  do 
    collection do 
      get 'search'
      get 'metadata_sheet'
      get 'search_result'
    end
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
 
  post 'publishers/new'
  post 'publishers/create'
  get 'journals/index'
  post 'books/new'
  
   resources :journals do
    collection { post :validate }
      collection do
      post 'create'
      get 'new'
      post 'new'
      get 'index'
      get 'new_article'
      post 'create_article'
      get 'search'
      get 'search_article'  
      get 'upload_article_metadata'
     end
   end

  get 'books/create'

  resources :books do
    collection do
      get 'index'
      post 'create'
      get 'search'
      get 'metadata_sheet'
      get 'onix_input'
      get 'onix_supp_sheet'
      post 'primary_content_info'
      get 'contributors/new'
      post 'contributors/create'
      post 'content_pricing'
      post 'content_access_rules'
      post 'seo_config'
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

  resources :promo_codes
 
end
