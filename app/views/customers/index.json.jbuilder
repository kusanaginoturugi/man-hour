json.array!(@customers) do |customer|
  json.extract! customer, :id, :short_name, :name, :post, :address1, :address2, :rep
  json.url customer_url(customer, format: :json)
end
