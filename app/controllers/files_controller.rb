class FilesController < ApplicationController
  include Files 

  def index
   # @files = File.search(params[:search])
  end

  def download
    selected_files = params[:files]
    selected_files.each do |file|
      send_file file
    end
  end

  def upload_file   
    if file_found? 
      download_files 
    else 
      flash[:notice] = 'Файл не найден !'
      render :index 
    end  
  end
end
