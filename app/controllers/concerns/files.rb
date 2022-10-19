module Files 
  extend ActiveSupport::Concern 
  attr_accessor :file_name  
  
  # загрузка файла 
  def download_files 
    send_file(current_path, filename: @file_name)
  end
  
  # определяем путь 
  def current_path 
    path = "/home/dima/Desktop/Files/"
    path + search_file_name
  end
  
  # определяем подходящий файл здесь будет поиск 
  def search_file_name 
    @file_name = "First_folder.zip"
  end
  
  # если файл найден true  
  def file_found? 
    true 
  end


end
