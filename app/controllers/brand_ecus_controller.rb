class BrandEcusController < ApplicationController
  before_action :set_brand_ecu, only: %i[ show edit update destroy ]

  # GET /brand_ecus or /brand_ecus.json
  def index
    @brand_ecus = BrandEcu.all
  end

  # GET /brand_ecus/1 or /brand_ecus/1.json
  def show
  end

  # GET /brand_ecus/new
  def new
    @brand_ecu = BrandEcu.new
  end

  # GET /brand_ecus/1/edit
  def edit
  end

  # POST /brand_ecus or /brand_ecus.json
  def create
    @brand_ecu = BrandEcu.new(brand_ecu_params)

    respond_to do |format|
      if @brand_ecu.save
        format.html { redirect_to brand_ecu_url(@brand_ecu), notice: "Brand ecu was successfully created." }
        format.json { render :show, status: :created, location: @brand_ecu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @brand_ecu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brand_ecus/1 or /brand_ecus/1.json
  def update
    respond_to do |format|
      if @brand_ecu.update(brand_ecu_params)
        format.html { redirect_to brand_ecu_url(@brand_ecu), notice: "Brand ecu was successfully updated." }
        format.json { render :show, status: :ok, location: @brand_ecu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @brand_ecu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brand_ecus/1 or /brand_ecus/1.json
  def destroy
    @brand_ecu.destroy

    respond_to do |format|
      format.html { redirect_to brand_ecus_url, notice: "Brand ecu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand_ecu
      @brand_ecu = BrandEcu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brand_ecu_params
      params.require(:brand_ecu).permit(:name)
    end
end
