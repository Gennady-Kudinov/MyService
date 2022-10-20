module Files 
  extend ActiveSupport::Concern 
  attr_accessor :file_name  
  
  # загрузка файла 
  def download_files 
    send_file(current_path, filename: @file_name)
  end
  
  # определяем путь 
  def current_path 
    path = "D://BAZA/Files/"
    path + search_file_name
  end
  
  # определяем подходящий файл здесь будет поиск 
  def search_file_name 
    @file_name = "HW8200598393_8200661124_SW8201010375_10144315AA_X7LLSRABH8H197909_E2.bin.zip"
  end
  
  # если файл найден true  
  def file_found? 
    true 
  end


end
