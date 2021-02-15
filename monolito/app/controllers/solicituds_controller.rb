class SolicitudsController < ApplicationController
  
  before_action :set_solicitud, only: [:show, :edit, :update, :destroy]

  layout "application"

  # GET /solicituds
  # GET /solicituds.json
  def index
   
    @solicituds = Solicitud.paginate(page: params[:page], per_page: 4)
    @departamentos = Departamento.all
    for s in @solicituds do
        if s.departamento_id?
            puts "dpto id: #{s.departamento_id}"
            s.departamento = Departamento.find(s.departamento_id)
            #puts "dpto cod_proyecto: #{s.departamento.cod_proyecto}"
            #puts "dpto numero: #{s.departamento.numero}"
            #s.proyecto = Proyecto.find(s.departamento.cod_proyecto)
            #puts "proyecto id: #{s.proyecto.id}"
        end
    end

    @variables = Variable.all
  end

  # GET /solicituds/1
  # GET /solicituds/1.json
  def show
    @variables = Variable.all
  end

  # GET /solicituds/new
  # GET /solicituds/new/:departamento_id
  def new
    #if !logged_in?
    #  redirect_to :root
    #end
    @solicitud = Solicitud.new
    @solicitud.departamento_id = params[:departamento_id]
    @variables = Variable.all
  end

  # GET /solicituds/1/edit
  def edit
    @variables = Variable.all
  end

  # POST /solicituds
  # POST /solicituds.json
  def create
    @solicitud = Solicitud.new(solicitud_params)

    respond_to do |format|
      if @solicitud.save
        format.html { redirect_to @solicitud, notice: 'Solicitud was successfully created.' }
        format.json { render :show, status: :created, location: @solicitud }
      else
        format.html { render :new }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solicituds/1
  # PATCH/PUT /solicituds/1.json
  def update
    respond_to do |format|
      if @solicitud.update(solicitud_params)
        format.html { redirect_to @solicitud, notice: 'Su solicitud fue grabada de manera exitosa.' }
        format.json { render :show, status: :ok, location: @solicitud }
      else
        format.html { render :edit }
        format.json { render json: @solicitud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solicituds/1
  # DELETE /solicituds/1.json
  def destroy
    @solicitud.destroy
    respond_to do |format|
      format.html { redirect_to solicituds_url, notice: 'Solicitud was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solicitud
      @solicitud = Solicitud.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def solicitud_params
      params.require(:solicitud).permit(:cod_solictud, :cod_departamento, :departamento_id, :tipo_documento, :numero_documento, :nombres, :apellidos, :correo, :telefono, :mensaje, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod)
    end
end
