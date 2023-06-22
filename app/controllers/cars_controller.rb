class CarsController < ApplicationController
  include ActionView::Helpers::UrlHelper
  require 'win32ole'
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, :check_user_admin!  

  def index
      @cars = Car.where(['vin LIKE ?', "%#{params[:search]}%"]).
      order(created_at: :desc).first(10)
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


  def view_car_order
    car = Car.find(params[:id])
    @order = car.orders.build
  end

  def view_car_orders
    car = Car.find(params[:id])
    @orders = car.orders
  end
  def set_car_order
    car   = Car.find(params[:id])
    order = car.orders.build(car_order_params)
    order.client_id = car.client_id
    order.save!
    redirect_to car_path(car)
  end

  def car_order_params
    params.require(:order).permit(:problem, :work_description, :mileage, :price, :files, :images)
  end

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
          # puts programm_create
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

  def open_explorer(path)
    if path
      shell = WIN32OLE.new('Shell.Application')
      shell.ShellExecute('explorer.exe', "/select,\"#{path.gsub('/', '\\')}\"", nil, 'open', 1)
    else
      link_to "Открыть папку", "file:///F:/BAZA" # обработка случая, когда файл не найден
    end
  end

 # def open_explorer(path)
 #   shell = WIN32OLE.new('Shell.Application')
 #   shell.ShellExecute('explorer.exe', "/select,\"#{path.gsub('/', '\\')}\"", nil, 'open', 1)
 # end

  def find_file(sw_ident)
    path = "F:/BAZA/**/#{sw_ident}/#{@licence}.*"
    files = Dir.glob(path)
    if files.any?
      return files.first
    else
      return link_to "Открыть папку", "file:///F:/BAZA"
    end
  end

  def programm_create
    @datetime = Time.new
    @licence = Client.find_by_id(car_params[:client_id]).licence
    @mileage = car_params[:mileage]
    @phone = car_params[:phone]
    @description = car_params[:description]
    @recommendation = car_params[:recommendation]
    @make = Make.find_by_id(car_params[:make_id]).name
    @model = Model.find_by_id(car_params[:model_id]).name
    @brand_ecu = BrandEcu.find_by_id(car_params[:brand_ecu_id]).name
    @model_ecu = ModelEcu.find_by_id(car_params[:model_ecu_id]).name
    @soft_ecu = SoftEcu.find_by_id(car_params[:soft_ecu_id]).name
    @sw_ident = SwIdent.find_by_id(car_params[:sw_ident_id]).name

    @directory_path = File.join("F:/BAZA", @brand_ecu, @model_ecu, @soft_ecu, @sw_ident, @licence.upcase)
    FileUtils.mkdir_p @directory_path
    sleep(1) # добавляем паузу на 1 секунду
    open_explorer(@directory_path)
    sleep(1) # добавляем паузу на 1 секунду
    open_explorer(@find_file)
    
    @database_file = File.new('F:/BAZA/database.txt', 'a+')
    @database_file.puts "#{@licence.upcase}  #{@brand_ecu}  #{@model_ecu} #{@sw_ident} #{car_params[:mileage]}км.  Сумма #{car_params[:sum]} Телефон #{car_params[:phone]} Дата #{@datetime}"
    @database_file.close

    @id_client = File.new("F:/BAZA/#{@brand_ecu}/#{@model_ecu}/#{@soft_ecu}/#{@sw_ident}/#{@licence.upcase}/#{@licence.upcase}.html", 'a+')
    @id_client.puts "<body>#{@licence} #{@brand_ecu} #{@model} #{@model_ecu} #{@sw_ident} #{@mileage}км. Сумма #{car_params[:sum]} Телефон #{@phone} Дата #{@datetime}<br />#{@description}<br />#{@recommendation}<br /><body>"
    @id_client.close
  end

end
