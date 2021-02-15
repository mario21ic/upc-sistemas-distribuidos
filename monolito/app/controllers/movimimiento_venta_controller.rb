class MovimimientoVentaController < ApplicationController
  before_action :set_movimimiento_ventum, only: [:show, :edit, :update, :destroy]

  # GET /movimimiento_venta
  # GET /movimimiento_venta.json
  def index
    @movimimiento_venta = MovimimientoVentum.all
  end

  # GET /movimimiento_venta/1
  # GET /movimimiento_venta/1.json
  def show
  end

  # GET /movimimiento_venta/new
  def new
    @movimimiento_ventum = MovimimientoVentum.new
  end

  # GET /movimimiento_venta/1/edit
  def edit
  end

  # POST /movimimiento_venta
  # POST /movimimiento_venta.json
  def create
    @movimimiento_ventum = MovimimientoVentum.new(movimimiento_ventum_params)

    respond_to do |format|
      if @movimimiento_ventum.save
        format.html { redirect_to @movimimiento_ventum, notice: 'Movimimiento ventum was successfully created.' }
        format.json { render :show, status: :created, location: @movimimiento_ventum }
      else
        format.html { render :new }
        format.json { render json: @movimimiento_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movimimiento_venta/1
  # PATCH/PUT /movimimiento_venta/1.json
  def update
    respond_to do |format|
      if @movimimiento_ventum.update(movimimiento_ventum_params)
        format.html { redirect_to @movimimiento_ventum, notice: 'Movimimiento ventum was successfully updated.' }
        format.json { render :show, status: :ok, location: @movimimiento_ventum }
      else
        format.html { render :edit }
        format.json { render json: @movimimiento_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movimimiento_venta/1
  # DELETE /movimimiento_venta/1.json
  def destroy
    @movimimiento_ventum.destroy
    respond_to do |format|
      format.html { redirect_to movimimiento_venta_url, notice: 'Movimimiento ventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movimimiento_ventum
      @movimimiento_ventum = MovimimientoVentum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movimimiento_ventum_params
      params.require(:movimimiento_ventum).permit(:numero_movimiento, :cod_venta, :tipo_movimiento, :numero_operacion, :monto, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod)
    end
end
