class ProformasController < ApplicationController
  include SessionsHelper
  before_action :set_proforma, only: [:show, :edit, :update, :destroy]

  layout "application"

  # GET /proformas
  # GET /proformas.json
  def index
    if !logged_in?
      redirect_to :root
    end
    @proformas = Proforma.paginate(page: params[:page], per_page: 4)
    for p in @proformas do
        if p.solicitud_id?
            p.solicitud = Solicitud.find(p.solicitud_id)
            puts "proforma solicitud id: #{p.solicitud.id}"
            puts "proforma solicitud nombres: #{p.solicitud.nombres}"
        end
    end
    @variables = Variable.all
  end

  # GET /proformas/1
  # GET /proformas/1.json
  def show
    @variables = Variable.all
  end

  # GET /proformas/new
  # GET /proformas/new/:solicitud_id
  def new
    if !logged_in?

      redirect_to :root

    end
    @proforma = Proforma.new
    if (params.has_key?(:solicitud_id))
        @solicitud = Solicitud.find(params[:solicitud_id])
        @proforma.solicitud_id = @solicitud.id
        @proforma.nombres = @solicitud.nombres
        @proforma.apellidos = @solicitud.apellidos
        @proforma.dni = @solicitud.numero_documento
        #puts "proforma dni: #{@proforma.dni}"
        @proforma.correo = @solicitud.correo
        @proforma.telefono = @solicitud.telefono

        puts "dpto ID => #{@solicitud.departamento_id}"
        @departamento = Departamento.find(@solicitud.departamento_id)
        <<-DOC
        case @departamento.piso
            when 1
              @proforma.descuento = 0
            when 2
              @proforma.descuento = 1
            when 3
              @proforma.descuento = 2
            when 4
              @proforma.descuento = 3
            else
              @proforma.descuento = 0
        end 
        DOC
        #@proforma.descuento = 50
        @proforma.descuento = @departamento.piso - 1
        #puts "cod proyecto: #{@departamento.cod_proyecto}"
        @proyecto = Proyecto.find(@departamento.cod_proyecto)
        #puts "precio m2: #{@proyecto.precio_m2}"
        @proforma.costo_base = @departamento.area_total * @proyecto.precio_m2
        @proforma.costo_final = @proforma.costo_base - ((@proforma.costo_base * @proforma.descuento)/100)
    end
    @variables = Variable.all
  end

  # GET /proformas/1/edit
  def edit
    @variables = Variable.all
  end

  # POST /proformas
  # POST /proformas.json
  def create
    @proforma = Proforma.new(proforma_params)

    respond_to do |format|
      if @proforma.save
        format.html { redirect_to @proforma, notice: 'Proforma was successfully created.' }
        format.json { render :show, status: :created, location: @proforma }
      else
        format.html { render :new }
        format.json { render json: @proforma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proformas/1
  # PATCH/PUT /proformas/1.json
  def update
    respond_to do |format|
      if @proforma.update(proforma_params)
        format.html { redirect_to @proforma, notice: 'Proforma generada correctamente.' }
        format.json { render :show, status: :ok, location: @proforma }
      else
        format.html { render :edit }
        format.json { render json: @proforma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proformas/1
  # DELETE /proformas/1.json
  def destroy
    @proforma.destroy
    respond_to do |format|
      format.html { redirect_to proformas_url, notice: 'Proforma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proforma
      @proforma = Proforma.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proforma_params
      params.require(:proforma).permit(:cod_proforma, :cod_solictud, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :solicitud_id, :nombres, :apellidos, :dni, :correo, :telefono, :costo_base, :descuento, :costo_final)
    end
end
