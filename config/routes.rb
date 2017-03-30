Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  get 'retailers/search'

  get 'end_user/search'
  
  post 'subject_groups/new'

  get 'end_user/new'
  get 'journals/search'

  get 'end_user/create'

  get 'site_settings/site_setting/index'

  post 'journals/new'

  post 'publishers/new'
  post 'publishers/create'

  get 'publishers/search'

  resources :admin_user do
    collection do 
      get 'search'
      get 'index'
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
 
  resources :access_tokens,:campaigns,:license_groups, :licenses,
            :subscriptions, :subject_groups  do 
    collection do 
      get 'search'
      get 'metadata_sheet'
      get 'search_result'
      get 'result'
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
      post 'create'
      post 'new'
    end
  end

  resources :retailers,:institution_account,:publishers,
            :journals,:promo_codes   

  resources :reports, :printhouse_setup, :manage_access, 
            :manage_user_account, :publisher_setup, 
            :end_user, only: [:index]
 
  root 'retailers#index'

end
