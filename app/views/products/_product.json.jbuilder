json.extract! product, :id, :name, :available, :price, :description, :type, :prompt_delivery, :stock, :preparation_time, :created_at, :updated_at
json.url product_url(product, format: :json)
