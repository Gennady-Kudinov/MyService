class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :authenticate_user! 

  # GET /cars or /cars.json
  def index
    @cars = Car.all
    # @cars = Car.where(["licence LIKE ?", "%#{params[:search]}%"])
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)
    respond_to do |format|
      
      if @car.save
        
        # если мы выбрали ecm, тогда метод будет вызываться
        # 
        folder_create unless @car.ecm_id.blank?    
        
        format.html { redirect_to car_url(@car), notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to car_url(@car), notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy

    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_params
    params.require(:car).permit(:model_id, :make_id, :client_id, :licence, :mileage, :vin,
                                :ecm_id)
  end

  def client_params
    params.require(:client).permit(:phone, :name, :client_id, :licence)
  end

  def ecm_params
    params.require(:ecm).permit!(:name, :ecm_id)
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

    @id_client = File.new("D://BAZA/#{@make}/#{@model}/#{@ecm}/#{@licence.upcase}.html", 'a+')
    @id_client.puts "<body>#{@licence} #{@make} #{@model} #{@mileage}км. Тип ЭБУ #{@ecm}: Сумма #{car_params[:sum]} Телефон #{@phone} Дата #{@datetime}<br />#{@description}<br />#{@recommendation}<br /><body>"
    @id_client.close
  end

end
