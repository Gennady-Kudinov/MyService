# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit destroy update]
  before_action :set_client, only: %i[index new create show edit update destroy]
  before_action :check_user_admin!

  def index
    @client = Client.find(params[:client_id])
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
  # Получаем список ранее прикрепленных файлов и изображений
  existing_files = @order.files_attachments.map(&:blob)
  existing_images = @order.images_attachments.map(&:blob)

  # Обновляем заказ с новыми параметрами
  if @order.update(order_params.reject { |key| key['files'] || key['images'] })
    # Если были загружены новые файлы или изображения, то добавляем их к списку ранее прикрепленных
    @order.files.attach(params[:order][:files]) if params[:order][:files]
    @order.images.attach(params[:order][:images]) if params[:order][:images]

    # Добавляем ранее прикрепленные файлы и изображения к списку вложений
    @order.files.attach(existing_files) if existing_files.any?
    @order.images.attach(existing_images) if existing_images.any?

    # Удаляем выбранные для удаления файлы и изображения
    if params[:remove_files] && params[:remove_files].any?
      @order.files_attachments.where(id: params[:remove_files]).each(&:destroy)
    end

    if params[:remove_images] && params[:remove_images].any?
      @order.images_attachments.where(id: params[:remove_images]).each(&:destroy)
    end

    redirect_to client_order_url(@client, @order), notice: "Order was successfully updated."
  else
    render :edit, status: :unprocessable_entity
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
      images: [],
      remove_files: [] # добавляем параметр для удаления файлов
    )
  end
end