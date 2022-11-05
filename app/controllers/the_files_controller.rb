class TheFilesController < ApplicationController
  before_action :set_the_file, only: %i[ show edit update destroy ]

  # GET /the_files or /the_files.json
  def index
    @the_files = TheFile.all
  end

  # GET /the_files/1 or /the_files/1.json
  def show
  end

  # GET /the_files/new
  def new
    @the_file = TheFile.new
  end

  # GET /the_files/1/edit
  def edit
  end

  # POST /the_files or /the_files.json
  def create
    @the_file = TheFile.new(the_file_params)

    respond_to do |format|
      if @the_file.save
        format.html { redirect_to the_file_url(@the_file), notice: "The file was successfully created." }
        format.json { render :show, status: :created, location: @the_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @the_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /the_files/1 or /the_files/1.json
  def update
    respond_to do |format|
      if @the_file.update(the_file_params)
        format.html { redirect_to the_file_url(@the_file), notice: "The file was successfully updated." }
        format.json { render :show, status: :ok, location: @the_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @the_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /the_files/1 or /the_files/1.json
  def destroy
    @the_file.destroy

    respond_to do |format|
      format.html { redirect_to the_files_url, notice: "The file was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_the_file
      @the_file = TheFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def the_file_params
      params.require(:the_file).permit(:file, :title, :text)
    end
end
