class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit destroy update]
  before_action :check_user_admin!

  def index
    @client = Client.find params[:client_id]
    @orders = Order.all.where("client_id == #{params[:client_id]}")
  end

  def search
    @search_results = Dir.glob("**/*#{params[:search]}*")
  end  

  def new
    @order = Order.new
  end

  def create
    @client = Client.find_by(id: order_params[:client_id])
    @order = Order.new order_params
    @order.client = @client

    if @order.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @search_results = Dir.glob("F:/BAZA/*#{params[:search]}*") if params[:search].present?
    @search_param = params[:search]
  end
  
  def copy_file

      source_file_path = params[:file_path]
      
      @directory_path = "F:/BAZA/#{@brand_ecu}/#{@model_ecu}/#{@soft_ecu}/#{@sw_ident}/#{(@licence || '').
      upcase}/#{File.basename(source_file_path)}"
      FileUtils.mkdir_p(File.dirname(@directory_path))
      FileUtils.cp(source_file_path, @directory_path)
    
      order_id = params[:id].presence || @order&.id
       #redirect_to order_path(id: order_id, search: params[:search])
  end
  
  def edit
    @client = Client.find params[:client_id]
  end

  def update
    if @order.update(order_params)
      redirect_to client_orders_path(@order.client_id)
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to client_orders_path(@order)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :problem,
      :work_description,
      :price,
      :client_id,
      :image,
      :images,
      :remove_image,
      :mileage
    )
  end

 

end
