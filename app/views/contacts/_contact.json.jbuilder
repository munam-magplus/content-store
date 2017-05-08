json.extract! contact, :id, :subject, :topic, :phone_number, :fax_number, :comments, :created_at, :updated_at
json.url contact_url(contact, format: :json)
