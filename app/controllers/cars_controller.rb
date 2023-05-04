class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, :check_user_admin!  

  def index
      @cars = Car.where(['vin LIKE ?', "%#{params[:search]}%"]).
      order(created_at: :desc).first(30)
  end

  def show
    @car = Car.find(params[:id])
    @client = @car.client
    @order = @client.orders.build
  end

  def new
    @car = Car.new
    @model_ecus = @car.brand_ecu&.model_ecus&.order(:name)
  end

  def edit; end

  def create
    @car = Car.new(car_params)
   # @car.soft_ecu_id = params[:soft_ecu_id]
    respond_to do |format|
      if @car.save

        @works = params.dig(:car, :works)

        case @works 
        when 'Diagnose'
          puts 'method1'
        when 'Programm'
          puts programm_create
        when 'Mileage_km'
          puts mileage_create
        when 'Airbag'
          puts @airbag_create
        end

        format.html { redirect_to car_url(@car), notice: "Car was successfully created." }
        format.json { render :new, status: :created, location: @OrdersController }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        
        @works = params.dig(:car, :works)

        case @works 
        when 'Diagnose'
          puts 'method1'
        when 'Programm'
          puts programm_create
        when 'Mileage_km'
          puts mileage_create
        when 'Airbag'
          puts airbag_create
        end 

        format.html { redirect_to car_url(@car), notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:model_id, :make_id, :client_id, :licence, :mileage, :vin,
                                :works, :airbag, :order_url, :order,
                                :brand_ecu_id, :model_ecu_id, :soft_ecu_id, :sw_ident_id)
  end

  def client_params
    params.require(:client).permit(:phone, :name, :client_id, :licence)
  end

  def mileage_create
    @licence = Client.find_by_id(car_params[:client_id]).licence
   # @make = Make.find_by_id(car_params[:make_id]).name
   # @model = Model.find_by_id(car_params[:model_id]).name
    @brand_ecu = BrandEcu.find_by_id(car_params[:brand_ecu_id]).name
    FileUtils.mkdir_p "F:/BAZA/#{@brand_ecu}/Mileage(Пробеги)/#{@licence}"
  end

  def airbag_create
    @licence = Client.find_by_id(car_params[:client_id]).licence
   # @make = Make.find_by_id(car_params[:make_id]).name
   # @model = Model.find_by_id(car_params[:model_id]).name
    @brand_ecu = BrandEcu.find_by_id(car_params[:brand_ecu_id]).name
    FileUtils.mkdir_p "F:/BAZA/#{@brand_ecu}/Airbag(подушки)/#{@licence}"
  end

  def programm_create
    @datetime = Time.new
    @licence = Client.find_by_id(car_params[:client_id]).licence
    @mileage = car_params[:mileage]
    @phone = car_params[:phone]
    @make = Make.find_by_id(car_params[:make_id]).name
    @model = Model.find_by_id(car_params[:model_id]).name
    @brand_ecu = BrandEcu.find_by_id(car_params[:brand_ecu_id]).name
    @model_ecu = ModelEcu.find_by_id(car_params[:model_ecu_id]).name
    @soft_ecu = SoftEcu.find_by_id(car_params[:soft_ecu_id]).name
    @sw_ident = SwIdent.find_by_id(car_params[:sw_ident_id]).name

    @directory_path = File.join("F:/BAZA", @brand_ecu, @model_ecu, @soft_ecu, @sw_ident, @licence.upcase)
    FileUtils.mkdir_p @directory_path
    
    @database_file = File.new('F:/BAZA/database.txt', 'a+')
    @database_file.puts "#{@licence.upcase}  #{@make}  #{@model}  Тип ЭБУ #{@brand_ecu} Модель ЭБУ #{@model_ecu} #{car_params[:mileage]}км.  Сумма #{car_params[:sum]} Телефон #{car_params[:phone]} Дата #{@datetime}"
    @database_file.close

    @id_client = File.new("F:/BAZA/#{@brand_ecu}/#{@model_ecu}/#{@soft_ecu}/#{@sw_ident}/#{@licence.upcase}/#{@licence.upcase}.html", 'a+')
    @id_client.puts "<body>#{@licence} #{@make} #{@model} #{@mileage}км. Тип ЭБУ #{@brand_ecu}: Модель ЭБУ #{@model_ecu}: Сумма #{car_params[:sum]} Телефон #{@phone} Дата #{@datetime}<br />#{@description}<br />#{@recommendation}<br /><body>"
    @id_client.close
  end

end
