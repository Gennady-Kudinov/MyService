class SwIdentsController < ApplicationController
  before_action :set_sw_ident, only: %i[ show edit update destroy ]

  # GET /sw_idents or /sw_idents.json
  def index
    @sw_idents = SwIdent.all

   # @soft_ecu = SoftEcu.find(params[:soft_ecu_id])
   # @sw_idents = @soft_ecu.sw_idents

   @sw_idents = SwIdent.where(soft_ecu_id: params[:soft_ecu_id])
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @sw_idents }
        end
  end

  # GET /sw_idents/1 or /sw_idents/1.json
  def show
  end

  # GET /sw_idents/new
  def new
    @sw_ident = SwIdent.new
  end

  # GET /sw_idents/1/edit
  def edit
  end

  # POST /sw_idents or /sw_idents.json
  def create
    @sw_ident = SwIdent.new(sw_ident_params)

    respond_to do |format|
      if @sw_ident.save
        format.html { redirect_to new_sw_ident_path(soft_ecu_id: params[:sw_ident][:soft_ecu_id]),
          notice: "Sw ident was successfully created." }
        format.json { render :show, status: :created, location: @sw_ident }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sw_ident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sw_idents/1 or /sw_idents/1.json
  def update
    respond_to do |format|
      if @sw_ident.update(sw_ident_params)
        format.html { redirect_to sw_ident_url(@sw_ident), notice: "Sw ident was successfully updated." }
        format.json { render :show, status: :ok, location: @sw_ident }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sw_ident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sw_idents/1 or /sw_idents/1.json
  def destroy
    @sw_ident.destroy

    respond_to do |format|
      format.html { redirect_to sw_idents_url, notice: "Sw ident was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sw_ident
      @sw_ident = SwIdent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sw_ident_params
      params.require(:sw_ident).permit(:name, :soft_ecu_id)
    end
end
