class ClientsController < ApplicationController

  attr_accessor :clients

    def new
      @client = Client.new
    end

    def index
      @clients = Client.all
      @clients = Client.where(["licence LIKE ?", "%#{params[:search]}%"]).order(created_at: :desc)
    end

    def show
      @client = Client.find(params[:id])
    end

    def create
       @client = Client.new(client_params)
       @client.licence = params[:client][:licence]
       @client.name = params[:client][:name].capitalize
       @client.phone = params[:client][:phone]
       @client.data = params[:client][:data]
       @client.save
      
       redirect_to :controller => 'cars', :action => 'new'
    end

    def edit
      @client = Client.find(params[:id])
    end

    def update
      @client = Client.find(params[:id])
      if @client.update(client_params)
        redirect_to @client
      else
        render action: 'edit'
      end
    end

        # DELETE /client/1 
    def destroy
      @client = Client.find(params[:id])
      @client.destroy

      redirect_to clients_path
    end

    private

    def client_params
        params.require(:client).permit(:phone, :name, :id, :licence, :data, :car_id, :make, :make_id, :models)
    end

end
