json.extract! contact_u, :id, :subject, :topic, :phone_number, :fax_number, :comments, :created_at, :updated_at
json.url contact_u_url(contact_u, format: :json)
