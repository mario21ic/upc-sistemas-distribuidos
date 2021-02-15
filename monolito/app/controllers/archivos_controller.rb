class ArchivosController < ApplicationController
  before_action :set_archivo, only: [:show, :edit, :update, :destroy]
  before_action :init, only: [:index,:new,:show,:edit]

  # GET /archivos
  # GET /archivos.json
  def index
    @archivos = Archivo.where(cod_proyecto:params[:cod_proyecto],cod_departamento:params[:cod_departamento])
    @proyecto = Proyecto.find(params[:cod_proyecto])
    if params[:cod_departamento] != "0"
      @departamento = Departamento.find(params[:cod_departamento])
    end
  end

  # GET /archivos/1
  # GET /archivos/1.json
  def show
  end

  # GET /archivos/new
  def new
    @archivo = Archivo.new
    @archivo.cod_proyecto = params[:cod_proyecto]
    @proyecto = Proyecto.find(params[:cod_proyecto])
    @archivo.cod_departamento = params[:cod_departamento]
  end

  # GET /archivos/1/edit
  def edit
    @proyecto = Proyecto.find(@archivo.cod_proyecto)
  end

  # POST /archivos
  # POST /archivos.json
  def create
    @archivo = Archivo.new(archivo_params)

    respond_to do |format|
      if @archivo.save
        format.html { redirect_to archivos_url(cod_proyecto:@archivo.cod_proyecto,cod_departamento:@archivo.cod_departamento), notice: 'Archivo was successfully created.' }
        format.json { render :show, status: :created, location: @archivo }
      else
        format.html { render :new }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archivos/1
  # PATCH/PUT /archivos/1.json
  def update
    respond_to do |format|
      if @archivo.update(archivo_params)
        format.html { redirect_to archivos_url(cod_proyecto:@archivo.cod_proyecto,cod_departamento:@archivo.cod_departamento), notice: 'Archivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @archivo }
      else
        format.html { render :edit }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archivos/1
  # DELETE /archivos/1.json
  def destroy
    @archivo.destroy
    respond_to do |format|
      format.html { redirect_to archivos_url, notice: 'Archivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_archivo
      @archivo = Archivo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def archivo_params
      params.require(:archivo).permit(:cod_archivo, :cod_tip_archivo, :cod_proyecto, :cod_departamento, :nombre_archivo, :descripcion_corta, :descripcion_larga, :orden, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod)
    end

    def init
      @variables = Variable.where(estado: 'A')
    end
end
