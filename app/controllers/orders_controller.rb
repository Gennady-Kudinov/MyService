class OrdersController < ApplicationController
  def index
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
    @client = Client.find(params[:id])
  end

  def edit
  end

  def destroy
  end

    private

  def order_params
    params.require(:order).permit(:problem, :work_description, :price, :client_id)
  end

end
