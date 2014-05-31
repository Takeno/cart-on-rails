json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :surname, :birthdate, :nickname, :password, :address_id
  json.url customer_url(customer, format: :json)
end
