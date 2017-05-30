Rails.application.routes.draw do

  get 'index_contents/content_code'

  get 'index_contents/publisher_code'

  get 'my_accounts/index'

  resources :site_settings do 
    collection do 
      get 'books_of_publisher'
      get 'simple_search'
    end
  end

  get 'homes/index'
  root :to => "homes#index"

  resources :contacts

  resources :reports, :printhouse_setup, 
             only: [:index]

  resources :books_seo_config,:books_content_access_rules,
            :books_content_pricing, :books_contributors 

  resources :institution_accounts do
    collection do 
      get 'search'
      get 'institution_admin_result'
    end
  end

  resources :library_users do 
    collection do
      get 'result'
    end
  end

  resources :articles do 
    collection do
      get 'search'
      get 'metadata_sheet'
    end
  end

  devise_for :users

  get 'users/sign_in'

  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end

  resources :retailers do 
    collection do
      get 'search'
      get 'result'
    end
  end

  resources :end_users, :admin_users do 
    collection do
      get  'search' 
      # post 'create'
    end
  end

  resources :content_conversations do
    collection do 
      get 'content_history'
      get 'index_content'
      get 'qa_check'
      get 'update_status'
      get 'uploaded_errors'
      get 'dashboard'
      get 'download_books'
      get 'download_article'
      get 'download_update_status'
      get 'download_index_content'
      get 'download_subject_group'
    end
  end
 
  resources :publishers, :access_tokens, :promo_codes, :campaigns, :license_groups, :licenses,
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
      get 'subject_group_search'
      get 'title_search'
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
      get 'search'
      get 'metadata_sheet'
      get 'onix_input'
      get 'onix_supp_sheet'
    end
  end

  resources :institution_admin_users do 
    collection do 
      get 'search'
    end
  end
  resources :themes do 
    collection do
      post 'save' 
      get 'change_theme'
      post 'save_theme_for_publisher'
      delete 'destroy'
    end
  end
  
end
