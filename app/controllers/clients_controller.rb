class ClientsController < ApplicationController
    before_action :check_user_admin! 

    attr_accessor :clients

    def new
      @client = Client.new
    end

    def index
      respond_to do |format|
        format.html do
          @clients = Client.all
          @clients = Client.where(["licence LIKE ?", "%#{params[:search]}%"]).order(created_at: :desc)
        end
          format.zip { respond_with_zipped_clients }
      end
    end

    def show
      @client = Client.find(params[:id])
    end

    def create
       @client = Client.new(client_params)
       @client.username = current_user.name 

       if @client.save 
         redirect_to clients_path 
       else
         render :new  
       end 
    end

    def edit
      @client = Client.find(params[:id])
    end

    def update
      @client = Client.find(params[:id])

      if @client.update(client_params)
        redirect_to clients_path
      else
        render :edit 
      end
    end

    def destroy
      @client = Client.find(params[:id])
      @client.destroy
      redirect_to clients_path
    end

    private

    def client_params
        params.require(:client).permit(:phone, :name, :id, :licence, :data, :car_id, :make, :make_id, :models, :username)
    end

    def respond_with_zipped_clients
      compressed_filestream = Zip::OutputStream.write_buffer do |zos|
        Client.order(created_at: :desc).each do |client|
          zos.put_next_entry "client.xlsx"
          zos.print render_to_string(
            layout: false, handlers: [:axlsx], formats: [:xlsx],
            template: 'clients/client',
            locals: {сlient: client}
          )
        end
      end
      compressed_filestream.rewind
      send_data compressed_filestream.read, filename: 'clients.zip'
    end
end