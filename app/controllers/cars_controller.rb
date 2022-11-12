class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, :check_user_admin!  

  def index
    @cars = Car.all.order(created_at: :desc) 
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    respond_to do |format|
      if @car.save
      
        @works = params.dig(:car, :works)

        case @works 
        when 'Diagnose'
          puts 'method1'
        when 'Programm'
          puts folder_create
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
          puts folder_create
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
                                :ecm_id, :works, :airbag, :order_url, :order)
  end

  def client_params
    params.require(:client).permit(:phone, :name, :client_id, :licence)
  end

  def ecm_params
    params.require(:ecm).permit!(:name, :ecm_id)
  end

  def mileage_create
    @licence = Client.find_by_id(car_params[:client_id]).licence
    @make = Make.find_by_id(car_params[:make_id]).name
    @model = Model.find_by_id(car_params[:model_id]).name
    FileUtils.mkdir_p "D://BAZA/#{@make}/#{@model}/Mileage(Пробеги)/#{@licence}"
  end

  def airbag_create
    @licence = Client.find_by_id(car_params[:client_id]).licence
    @make = Make.find_by_id(car_params[:make_id]).name
    @model = Model.find_by_id(car_params[:model_id]).name
    FileUtils.mkdir_p "D://BAZA/#{@make}/#{@model}/Airbag(подушки)/#{@licence}"
  end

  def folder_create
    @datetime = Time.new
    @licence = Client.find_by_id(car_params[:client_id]).licence
    @mileage = car_params[:mileage]
    @phone = car_params[:phone]
    @make = Make.find_by_id(car_params[:make_id]).name
    @model = Model.find_by_id(car_params[:model_id]).name
    @ecm = Ecm.find_by_id(car_params[:ecm_id]).name

    FileUtils.mkdir_p "D://BAZA/#{@make}/#{@model}/#{@ecm}/#{@licence.upcase}"

    @database_file = File.new('D://BAZA/database.txt', 'a+')
    @database_file.puts "#{@licence.upcase}  #{@make}  #{@model}  #{car_params[:mileage]}км.  Сумма #{car_params[:sum]} Телефон #{car_params[:phone]} Дата #{@datetime}"
    @database_file.close

    @id_client = File.new("D://BAZA/#{@make}/#{@model}/#{@ecm}/#{@licence.upcase}/#{@licence.upcase}.html", 'a+')
    @id_client.puts "<body>#{@licence} #{@make} #{@model} #{@mileage}км. Тип ЭБУ #{@ecm}: Сумма #{car_params[:sum]} Телефон #{@phone} Дата #{@datetime}<br />#{@description}<br />#{@recommendation}<br /><body>"
    @id_client.close
  end

end
