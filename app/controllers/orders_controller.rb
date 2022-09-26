class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit destroy update]

  def index
    @client = Client.find params[:client_id]
    @orders = Order.all.where("client_id == #{params[:client_id]}")
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
    params.
      require(:order).
      permit(:problem, :work_description, :price, :client_id)
  end

end
