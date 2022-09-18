class OrdersController < ApplicationController
  def index
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
      redirect_to root_path 
    else 
      render :new 
    end 
     
  end
  
  def show 
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update 
    @order = Order.find(params[:id]) 

    if @order.update order_params 
      redirect_to client_orders_path(@order.client_id) 
    else 
      render :edit 
    end 
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy 
    redirect_to client_orders_path(@order)
  end

    private

  def order_params
    params.require(:order).permit(:problem, :work_description, :price, :client_id)
  end

end
