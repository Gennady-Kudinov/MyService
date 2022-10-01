class EcmsController < ApplicationController
  def index
  end

  def new
    @ecm = Ecm.new
  end

  def create
    @ecm = Ecm.new ecm_params 
    @ecm.name = ecm_params[:name]
    @ecm.save

    if @ecm.save
      redirect_to new_car_path 
    else 
      render :new 
    end 
  end

  def destroy
  end

  private

  def ecm_params
    params.require(:ecm).permit(:name)
  end

end
