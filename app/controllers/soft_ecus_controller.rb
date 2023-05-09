class SoftEcusController < ApplicationController
    before_action :set_soft_ecu, only: %i[ show edit update destroy ]
  
    # GET /soft_ecus or /model_ecus.json
    def index
      @soft_ecus = SoftEcu.where(model_ecu_id: params[:model_ecu_id]).order(:name) # сортировка по имени софта
    
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @soft_ecus }
      end
    end    
  
    # GET /soft_ecus/1 or /soft_ecus/1.json
    def show; end
  
    # GET /soft_ecus/new
    def new
      @soft_ecu = SoftEcu.new
    #  render 'my_custom_template'
    end
  
    # GET /soft_ecus/1/edit
    def edit; end
  
    # POST /model_ecus or /model_ecus.json
    def create
      @soft_ecu = SoftEcu.new(soft_ecu_params)
  
      respond_to do |format|
        if @soft_ecu.save
          format.html { redirect_to new_soft_ecu_url(model_ecu_id: params[:soft_ecu][:model_ecu_id]),
            notice: "Soft ident was successfully created." }
          format.json { render :show, status: :created, location: @soft_ecu }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @soft_ecu.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /model_ecus/1 or /model_ecus/1.json
    def update
      respond_to do |format|
        if @soft_ecu.update(soft_ecu_params)
          format.html { redirect_to soft_ecu_url(@soft_ecu), notice: "Soft ecu was successfully updated." }
          format.json { render :show, status: :ok, location: @soft_ecu }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @soft_ecu.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /model_ecus/1 or /model_ecus/1.json
    def destroy
      @soft_ecu.destroy
  
      respond_to do |format|
        format.html { redirect_to soft_ecus_url, notice: "Soft ecu was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_soft_ecu
        @soft_ecu = SoftEcu.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def soft_ecu_params
        params.require(:soft_ecu).permit(:name, :model_ecu_id)
      end
  end
  