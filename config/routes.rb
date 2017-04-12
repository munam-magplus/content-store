Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get 'retailers/search'

  get 'site_settings/index'

  post 'subject_groups/new'
  get 'subject_groups/search_result'

  get 'books/create'
  post 'books/new'

  get 'end_user/new'
  get 'end_user/index'
  get 'end_user/search'
  get 'end_user/create'
  post 'end_user/create'

  post 'publishers/new'
  post 'publishers/create'

  get 'admin_user/new'
  get 'admin_user/create'
  get 'admin_user/search'
  get 'admin_user/index'
  post 'admin_user/new'
  post 'admin_user/create'
  post 'admin_user/index'

  resources :content_conversation do
    collection do 
      get 'content_history'
      get 'index_content'
      get 'qa_check'
      get 'update_status'
      get 'uploaded_errors'
    end
  end
 
  resources :publishers, :access_tokens, :promo_codes, :campaigns, :license_groups, :licenses,
            :subscriptions, :subject_groups  do 
    collection do 
      get 'search'
      get 'search_content'
      get 'metadata_sheet'
      get 'search_result'
      get 'apply_discount'
      get 'result'
    end
  end

  post 'journals/create'
  get 'journals/result_article'
  get 'journals/search_result'
  
  resources :journals do
    collection do
      get 'index'
      get 'search'  
      get 'upload_article_metadata'
      get 'search_article'
      get 'new_article'
      post 'create_article'
    end
  end

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
  end  

  resources :institution_admin_user do 
    collection do 
      get 'search_op'
      # post 'create'
      # get 'new'
    end
  end

  get 'institution_account/search_op'

  resources :retailers,:institution_account

  resources :reports, :printhouse_setup, :manage_access, 
            :manage_user_account, :publisher_setup, 
            :end_user, only: [:index]
end
