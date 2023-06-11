json.extract! order, :id, :image, :title, :name, :price, :remove_image,
:problem, :client_id, :mileage, :work_description, :created_at, :updated_at
json.url order_url(order, format: :json)
json.image url_for(order.image)
