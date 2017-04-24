json.extract! library_user, :id, :first_name, :last_name, :email, :user_name, :password, :confirm_password, :country, :status, :created_at, :updated_at
json.url library_user_url(library_user, format: :json)
