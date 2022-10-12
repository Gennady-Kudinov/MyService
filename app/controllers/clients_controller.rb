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

end
