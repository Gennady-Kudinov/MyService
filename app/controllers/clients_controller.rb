class ClientsController < ApplicationController
  include SaveImages

  before_action :set_client, only: %i[show edit destroy update]
  before_action :check_user_admin!
  attr_accessor :clients

  def new
    @client = Client.new
  end

  def index  
    if params[:licence].present? || params[:search].present?
      if params[:licence].present?  
        @clients =  
          Client.where(['licence LIKE ?', "%#{params[:licence]}%"]).order(  
            created_at: :desc ) 
      else  
        @clients =  
          Client.joins(cars: [:model, :sw_ident]).where(['models.name LIKE ? OR sw_idents.name LIKE ?',
            "%#{params[:search]}%", "%#{params[:search]}%"]).order(  
            created_at: :desc )
      end  
    else
      respond_to do |format|
        format.html do
          @clients =
            Client.where(['licence LIKE ?', "%#{params[:search]}%"]).order(
              created_at: :desc ).first(5)
        end
        format.zip { respond_with_zipped_clients }
      end
    end
  end

  def show; end

  def create
    licence = client_params[:licence]
    client  = Client.find_by(licence: licence)

    if client
      redirect_to client_orders_path(client)
    else
      Client.new(client_params).work_performer(current_user).save
      redirect_to clients_path
    end
  end

  def edit; end

  def update
    if @client.update(client_params)
      redirect_to clients_path
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  def destroy_all
    if params[:turbo_confirm] == "yes"
      Client.destroy_all
      redirect_to clients_path, notice: "Все клиенты были удалены."
    else
      redirect_to clients_path, alert: "Удаление всех клиентов отменено."
    end
  end


  def save_image(path = '')
    clients = Client.all

    clients.each do |client|
      if client.cars.present?
        path = get_path_for_client(client.cars.first)
        client.orders.each do |order|
          p path
          save_image_from_order(order, path) if order.image?
        end
      end
    end

    redirect_to clients_path
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(
      :phone,
      :name,
      :id,
      :licence,
      :data,
      :car_id,
      :make,
      :make_id,
      :models,
      :username
    )
  end

  def respond_with_zipped_clients
    compressed_filestream =
      Zip::OutputStream.write_buffer do |zos|
        Client.order(created_at: :desc).each do |client|
          zos.put_next_entry 'client.xlsx'
          zos.print render_to_string(
                      layout: false,
                      handlers: %i[axlsx],
                      formats: %i[xlsx],
                      template: 'clients/client',
                      locals: { сlient: client }
                    )
        end
      end
    compressed_filestream.rewind
    send_data compressed_filestream.read, filename: 'clients.zip'
  end
end
