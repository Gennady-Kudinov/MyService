module ClientsHelper
  
  def client_car(client) 
    first_car = client.cars.first 
    
    return 'Машины нет' if first_car.nil? 
    first_car.make.name + ' ' +  first_car.model.name
  end

end
