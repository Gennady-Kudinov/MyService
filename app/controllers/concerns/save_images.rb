module SaveImages
  extend ActiveSupport::Concern

  def get_path_for_client(car)
    licence = Client.find(car.client_id).licence
   # make = Make.find(car.make_id).name
   # model = Model.find(car.model_id).name
   # ecm = Ecm.find(car.ecm_id).name

    path = "D://baza/Images/#{licence.upcase}"
  end

  def save_image_from_order(order, path) 
    # path можно заменить на другой путь
    FileUtils.cp order.image.path, path 
    rescue => e
      p e.message  
  end
end
