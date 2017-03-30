Rails.application.routes.draw do

  devise_for :users
  
  get 'end_user/search'
  
  post 'subject_groups/new'

  get 'end_user/new'
  get 'journals/search'

  get 'end_user/create'

  get 'site_settings/site_setting/index'

  # get 'admin_user/search'
  # # post 'admin_user/search'

  # get 'admin_user/new'
  # post 'admin_user/new'

  resources :admin_user do
    collection do 
      get 'search'
      get 'index'
    end
  end

  resources :retailers do
    collection do 
      get 'search'
    end
  end

  get 'institution/result'

  resources :institution_user, :institution, :access_tokens, :promo_codes, :campaigns,
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
  
  # resources :journals do
  #   collection do
  #     get 'index'
  #     get 'search'  
  #     get 'upload_article_metadata'
  #     get 'search_article'
  #     get 'new_article'
  #   end
  # end

  get 'books/create'

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

# get 'journals/new'
# post  'journals/create'

resources :journals

post 'journals/new'

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

 
  root 'csretailers#index'

end