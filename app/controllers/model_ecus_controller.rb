class ModelEcusController < ApplicationController
  before_action :set_model_ecu, only: %i[ show edit update destroy ]

  # GET /model_ecus or /model_ecus.json
  def index
   # @model_ecus = ModelEcu.all
  
    @model_ecus = ModelEcu.where(brand_ecu_id: params[:brand_ecu_id])
      respond_to do |format|
        format.json { render json: @model_ecus }
      end
  end

  # GET /model_ecus/1 or /model_ecus/1.json
  def show
  end

  # GET /model_ecus/new
  def new
    @model_ecu = ModelEcu.new
  end

  # GET /model_ecus/1/edit
  def edit
  end

  # POST /model_ecus or /model_ecus.json
  def create
    @model_ecu = ModelEcu.new(model_ecu_params)

    respond_to do |format|
      if @model_ecu.save
        format.html { redirect_to model_ecu_url(@model_ecu), notice: "Model ecu was successfully created." }
        format.json { render :show, status: :created, location: @model_ecu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @model_ecu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_ecus/1 or /model_ecus/1.json
  def update
    respond_to do |format|
      if @model_ecu.update(model_ecu_params)
        format.html { redirect_to model_ecu_url(@model_ecu), notice: "Model ecu was successfully updated." }
        format.json { render :show, status: :ok, location: @model_ecu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @model_ecu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_ecus/1 or /model_ecus/1.json
  def destroy
    @model_ecu.destroy

    respond_to do |format|
      format.html { redirect_to model_ecus_url, notice: "Model ecu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_ecu
      @model_ecu = ModelEcu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def model_ecu_params
      params.require(:model_ecu).permit(:name, :brand_ecu_id)
    end
end
