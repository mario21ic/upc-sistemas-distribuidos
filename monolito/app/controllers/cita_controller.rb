class CitaController < ApplicationController
  include SessionsHelper
  before_action :set_citum, only: [:show, :edit, :update, :destroy]

  # GET /cita
  # GET /cita.json
  def index
    if !logged_in?

      redirect_to :root

    end
    @citas = Citum.paginate(page: params[:page], per_page: 4)
  end

  # GET /cita/1
  # GET /cita/1.json
  def show
  end

  # GET /cita/new
  # GET /cita/new/:solicitud_id
  def new
    if !logged_in?

      redirect_to :root

    end
    @citum = Citum.new
    @citum.solicitud_id = params[:solicitud_id]
  end

  # GET /cita/1/edit
  def edit
  end

  # POST /cita
  # POST /cita.json
  def create
    @citum = Citum.new(citum_params)

    respond_to do |format|
      if @citum.save
        format.html { redirect_to @citum, notice: 'Citum was successfully created.' }
        format.json { render :show, status: :created, location: @citum }
      else
        format.html { render :new }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cita/1
  # PATCH/PUT /cita/1.json
  def update
    respond_to do |format|
      if @citum.update(citum_params)
        format.html { redirect_to @citum, notice: 'La cita se registro correctamente.' }
        format.json { render :show, status: :ok, location: @citum }
      else
        format.html { render :edit }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cita/1
  # DELETE /cita/1.json
  def destroy
    @citum.destroy
    respond_to do |format|
      format.html { redirect_to cita_url, notice: 'Citum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citum
      @citum = Citum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def citum_params
      params.require(:citum).permit(:cod_cita, :cod_solicitud, :solicitud_id, :fecha, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod)
    end
end
