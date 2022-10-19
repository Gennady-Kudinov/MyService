module Files 
  extend ActiveSupport::Concern 
  attr_accessor :file_name  

  def download_files 
    send_file(current_path, filename: @file_name)
  end
  
  # определяем путь 
  def current_path 
    path = "/home/dima/Desktop/Files/"
    path + search_file_name
  end
  
  # определяем подходящий файл 
  def search_file_name 
    @file_name = "First_folder.zip"
  end
  
  def file_found? 
    true 
  end


end
