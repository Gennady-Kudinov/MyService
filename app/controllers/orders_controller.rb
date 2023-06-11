class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit destroy update]
  before_action :set_client, only: %i[index new create show edit update destroy]
  before_action :check_user_admin!

  def index 
    @orders = Order.all.where("client_id == #{params[:client_id]}")
  end

  def new
   # @order = Order.new
    @order = @client.orders.build
  end

  def create
    @order = @client.orders.build(order_params)

    if @order.persisted?
      @order.images_will_change!
    end

    respond_to do |format|
      if @order.save
      format.html { redirect_to client_order_url(@client, @order), notice: "Order was successfully created." }
      format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end
  
  def edit; end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to client_order_url(@client, @order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
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

  def set_client
    @client = Client.find(params[:client_id])
  end

  def order_params
    params.require(:order).permit(
      :problem,
      :work_description,
      :price,
      :client_id,
      :remove_image,
      :mileage,
      files: [],
      images: []
    )
  end
end