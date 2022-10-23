module ClientsHelper
  def mileage_km(client)
    first_mileage = client.cars.first

    return 'пробег не известен' if first_mileage.nil?
    first_mileage.mileage
  end

  def link(client)
    first_car = client.cars.first
    return link_to 'Добавить а/м', new_car_path if first_car.nil?
    first_car.make.name + ' ' + first_car.model.name
  end

  def get_max_mileage(client)
    max_mileage = client.orders.first.mileage
    client.orders.each do |order|
      max_mileage = order.mileage if order.mileage >= max_mileage
    end
    max_mileage 
  end
end
