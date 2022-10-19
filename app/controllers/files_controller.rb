class FilesController < ApplicationController
  include Files 

  def index; end

  def upload_file   
    if file_found? 
      download_files 
    else 
      flash[:notice] = 'Файл не найден !'
      render :index 
    end  
  end
end
