json.extract! contact_request, :id, :name, :email, :subject, :message, :created_at, :updated_at
json.url contact_request_url(contact_request, format: :json)
