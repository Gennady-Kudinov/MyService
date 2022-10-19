class FilesController < ApplicationController
  include Files 

  def index
    download_files 
  end
end
