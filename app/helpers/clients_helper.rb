module ClientsHelper
    # Метод вывода пробега из машины
  def mileage_km(client)
    first_mileage = client.cars.first

    return 'пробег не известен' if first_mileage.nil?
    first_mileage.mileage
  end
    # Метод вывода модели машины или ссылки на создание новой машины
  def link(client)
    first_car = client.cars.first
    return link_to 'Добавить а/м', new_car_path if first_car.nil?
    first_car.make.name + ' ' + first_car.model.name
  end
    # Метод вывода пробега из ордера (но только если он больше предыдущего)
  def get_max_mileage(client)
    max_mileage = 0
    client.orders.each do |order|
      max_mileage = order.mileage if order.mileage >= max_mileage
    end
    max_mileage 
  end
end
