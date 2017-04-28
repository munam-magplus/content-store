Rails.application.routes.draw do

  get 'my_account/index'

  get 'site_settings/index'

  get 'books/create'
  post 'books/new'

  resources  :contact_us

  resources :reports, :printhouse_setup, :manage_access, 
            :manage_user_account, :publisher_setup, 
             only: [:index]

  resources :books_seo_config,:books_content_access_rules,
            :books_content_pricing, :books_contributor, only: [:new, :create]

  resources :institution_account do
    collection do 
      get 'search_op'
      get 'inst_admin_result'
    end
  end

  resources :library_users do 
    collection do
      get 'result'
    end
  end

  resources :article do 
    collection do
      get 'search'
      get 'result'
      get 'metadata_sheet'
    end
  end
 
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :retailers do 
    collection do
      get 'search'
    end
  end

  resources :end_user, :admin_user do 
    collection do
      get  'search' 
    end
  end


  resources :content_conversation do
    collection do 
      get 'content_history'
      get 'index_content'
      get 'qa_check'
      get 'update_status'
      get 'uploaded_errors'
      get 'dashboard'
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
  
  resources :journals do
    collection do
      get 'index'
      get 'search'
      get 'search_result'  
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

  resources :institution_admin_user do 
    collection do 
      get 'search_op'
    end
  end

end
