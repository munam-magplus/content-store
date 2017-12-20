Rails.application.routes.draw do

  get 'welcome/new'

  get 'welcome/index'

  mount Ckeditor::Engine => '/ckeditor'
  resources :subject_group_books do 
    collection do
      get 'metadata_sheet'
      post 'import'
      post 'unassociate_books'
    end
  end
 mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
 
  get 'index_contents/content_code'

  get 'index_contents/publisher_code'

  get 'my_accounts/index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :site_settings do 
    collection do 
      get 'books_of_publisher'
      get 'simple_search'
      get 'homepage'
      get 'new_homepage'
      patch 'update_homepage'
    end
  end

  get 'homes/index'
  root :to => "homes#index"
  get 'homes/search'
  get 'homes/subscribes_books'
  get 'homes/institution_edit'
  get 'homes/institution_profile_wta'

  resources :homes do
    collection do
      get  'permission_check_for_books'
      get  'books_by_category'
      get  'books_by_subject'
      get  'about'
      get  'terms_and_conditions'
      get  'policy'
      post 'wt_books_description' 
      get 'books_description'
      get 'wt_categories'
      get 'advance_search'
      get 'books_by_title'
      post 'send_mail'
      get 'refine_search'
      get 'refine_publishers_book'
      get 'refine_search_by_subject'
      get 'get_search_results'
      get 'get_author'
      get 'books_by_author'
      get 'contact'
      get 'catalogue'
      get 'search'
      get 'sign_in'
      post 'login'
      get 'registration'
      post 'sign_up'
      delete 'logout'
      get 'current_user'
      get 'my_profile'
    end
  end

  resources :subject_groups do 
    collection do 
      get 'associate_book'
      get 'unassociate_book'
      post 'import'
      get 'metadata_sheet'
      get 'search'      
    end
  end 
 
  resources :contacts
  resources :subjects do
    collection do
      get 'search'
      post 'import'
      get 'metadata_sheet'
    end
  end

  resources :reports, :printhouse_setup, 
             only: [:index]
  resources :books_seo_config,:books_content_access_rules,
            :books_content_pricing, :books_contributors 
  resources :institution_accounts do
    collection do 
      get 'search'
      get 'add_subscription'
      post 'add_subscription_tag'
      get 'institution_admin_result'
      get 'metadata_for_institution_accounts'
      get 'metadata_for_institution_accounts_billing'
      get 'metadata_for_ip_address'
      post 'import_for_institution_accounts'
      post 'import_for_institution_accounts_billing'
      post 'import_for_ip_address'
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
  
  # devise_for :users, :controllers => {:registrations => "users/registrations"}

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
      get  'metadata_sheet'
      post 'import_for_end_users'
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
  
  resources :subscriptions do
    collection do
      get 'view'
      post 'link'
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
      get 'associate_subscription_with_books'
      get 'associate_subscription_with_institutes'
      post 'import_for_subscription_institute'
      post 'import_for_subscription'
      post 'import'
    end
  end

  resources :publishers, :access_tokens, :promo_codes, :campaigns, :license_groups, :licenses,
            :subscriptions, :member_publishers do 
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
      post 'save'
      get 'search'
      get 'metadata_sheet_for_books_primary_information'
      get 'metadata_sheet_for_books_contributor'
      get 'onix_input'
      get 'onix_supp_sheet'
      post 'import'
      post 'import_contributor'
      delete 'destroy'
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
