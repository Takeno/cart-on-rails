json.array!(@orders) do |order|
  json.extract! order, :id, :completationDate
  json.url order_url(order, format: :json)
end
