Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :subject_group_books 
 
  get 'index_contents/content_code'

  get 'index_contents/publisher_code'

  get 'my_accounts/index'

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

  resources :homes do
    collection do
      get 'books_by_category'
      get 'about'
      get 'terms_and_conditions'
      get 'policy'
      get 'books_description'
      get 'advance_search'
      get 'get_search_results'
      get 'books_by_author'
      get 'books_by_title'
      get 'contact'
      post 'send_mail'
      get 'download_pdf'
    end
  end

  post 'subject_groups/associate_book'

  resources :contacts

  resources :subjects do
    collection do
      get 'search'
    end
  end

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
      get 'associate_book'
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
