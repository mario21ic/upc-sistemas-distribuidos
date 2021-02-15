class VentaController < ApplicationController
  include SessionsHelper
  before_action :set_ventum, only: [:show, :edit, :update, :destroy]

  layout "application"

  # GET /venta
  # GET /venta.json
  def index
    if !logged_in?
      redirect_to :root
    end
    @ventas = Ventum.paginate(page: params[:page], per_page: 4)
    for v in @ventas do
        if v.departamento_id?
            v.departamento = Departamento.find(v.departamento_id)
            puts "v dpto id: #{v.departamento.id}"
            puts "v dpto cod_proyecto: #{v.departamento.cod_proyecto}"
        end
    end
    @variables = Variable.all
  end

  # GET /venta/1
  # GET /venta/1.json
  def show
    @variables = Variable.all
  end

  # GET /venta/new
  # GET /venta/new/:departamento_id
  def new
    if !logged_in?
      redirect_to :root
    end
    @ventum = Ventum.new
    @ventum.departamento_id = params[:departamento_id]
    @variables = Variable.all
  end

  # GET /venta/1/edit
  def edit
    @variables = Variable.all
  end

  # POST /venta
  # POST /venta.json
  def create
    @ventum = Ventum.new(ventum_params)

    respond_to do |format|
      if @ventum.save
        puts "dpto ID: #{@ventum.departamento_id}"
        departamento = Departamento.find(@ventum.departamento_id)
        departamento.vendido = TRUE
        departamento.save
        format.html { redirect_to @ventum, notice: 'Ventum was successfully created.' }
        format.json { render :show, status: :created, location: @ventum }
      else
        format.html { render :new }
        format.json { render json: @ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venta/1
  # PATCH/PUT /venta/1.json
  def update
    respond_to do |format|
      if @ventum.update(ventum_params)
        format.html { redirect_to @ventum, notice: 'La venta se realizo exitosamente.' }
        format.json { render :show, status: :ok, location: @ventum }
      else
        format.html { render :edit }
        format.json { render json: @ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venta/1
  # DELETE /venta/1.json
  def destroy
    @ventum.destroy
    respond_to do |format|
      format.html { redirect_to venta_url, notice: 'Ventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ventum
      @ventum = Ventum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ventum_params
      params.require(:ventum).permit(:cod_venta, :tipo_documento, :numero_documento, :cod_departamento, :cod_solicitud, :tipo_compra, :total, :saldo, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :nombres, :apellidos, :correo, :telefono, :operacion_bancaria, :monto, :financiado, :departamento_id)
    end
end
