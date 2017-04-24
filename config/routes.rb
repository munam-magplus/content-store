Rails.application.routes.draw do

  get 'books_seo_config/new'

  post 'books_seo_config/create'

  get 'books_content_access_rules/new'

  post 'books_content_access_rules/create'

  get 'books_content_pricing/new'

  post 'books_content_pricing/create'

  get 'books_contributor/new'

  post 'books_contributor/create'

  resources :library_users
  get 'my_account/index'


  get 'article/new'

  get 'article/index'

  post 'article/create'

  get 'article/search'

  get 'article/result'

  get 'article/metadata_sheet'

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get 'retailers/search'

  get 'site_settings/index'

  post 'subject_groups/new'

  get 'books/create'
  post 'books/new'

  get 'end_user/search'
  post 'end_user/create'
  
  post 'subject_groups/new'

  get 'end_user/new'

  get 'end_user/create'
  get 'end_user/index'

  post 'publishers/new'
  post 'publishers/create'

  get 'end_user/search'
  get 'end_user/new'
  get 'end_user/create'

  get 'admin_user/new'
  get 'admin_user/create'
  get 'admin_user/search'
  get 'admin_user/index'
  post 'admin_user/index'
  post 'admin_user/new'
  post 'admin_user/create'


  get 'institution_account/inst_admin_result'

  resources :content_conversation do
    collection do 
      get 'content_history'
      get 'index_content'
      get 'qa_check'
      get 'update_status'
      get 'uploaded_errors'
    end
  end
 
  resources :publishers,  :access_tokens, :promo_codes, :campaigns, :license_groups, :licenses,
            :subscriptions, :subject_groups, :member_publishers do 
    collection do 
      post 'save'
      get 'search'
      get 'content_search'
      get 'metadata_sheet'
      get 'search_result'
      get 'apply_discount'
      get 'result'
      get 'linked_member_publisher'
    end
  end


  post 'books/new'
  
  get 'books/create'

  post 'journals/create'
  get 'journals/search_result'
  
  resources :journals do
    collection do
      get 'index'
      get 'search'  
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
