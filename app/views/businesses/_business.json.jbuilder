json.extract! business, :id, :name, :email, :is_owner, :location, :telephone, :website, :instagram, :opens_at, :closes_at, :business_type_id, :created_at, :updated_at
json.url business_url(business, format: :json)
