class DepartamentosController < ApplicationController
  before_action :init, only: [:show, :edit, :update, :destroy, :index, :new,:home]
  before_action :set_departamento, only: [:show, :edit, :update, :destro, :home]
  before_action :set_proyecto, only: [:new,:index]
  before_action :set_proyecto2, only: [:show,:edit,:home]

  # GET /departamentos
  # GET /departamentos.json
  def index
      @archivos = Archivo.where(estado: 'A')
    @departamentos = Departamento.where(cod_proyecto: params[:cod_proyecto])
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def show
      @archivos = Archivo.where(estado: 'A')
    
  end

  # GET /departamentos/1
  # GET /departamentos/1.json
  def home
    @home = 'S'
    show
  end

  # GET /departamentos/new
  def new
    @departamento = Departamento.new
    @departamento.cod_proyecto = params[:cod_proyecto]
  end

  # GET /departamentos/1/edit
  def edit
  end

  # POST /departamentos
  # POST /departamentos.json
  def create
    @departamento = Departamento.new(departamento_params)

    respond_to do |format|
      if @departamento.save
        format.html { redirect_to @departamento, notice: 'Departamento was successfully created.' }
        format.json { render :show, status: :created, location: @departamento }
      else
        format.html { render :new }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departamentos/1
  # PATCH/PUT /departamentos/1.json
  def update
    respond_to do |format|
      if @departamento.update(departamento_params)
        format.html { redirect_to @departamento, notice: 'Departamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @departamento }
      else
        format.html { render :edit }
        format.json { render json: @departamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departamentos/1
  # DELETE /departamentos/1.json
  def destroy
    @departamento.destroy
    respond_to do |format|
      format.html { redirect_to departamentos_url, notice: 'Departamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departamento
      @departamento = Departamento.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def departamento_params
      params.require(:departamento).permit(:cod_departamento, :cod_proyecto, :numero, :piso, :area_total, :area_techada, :dormitorios, :baños, :mca_favorito, :descripcion_corta, :descripcion_larga, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :separado)
    end

    def set_proyecto
      @proyecto = Proyecto.find(params[:cod_proyecto])
    end

    def set_proyecto2
      @proyecto = Proyecto.find(@departamento.cod_proyecto)
    end

    def init
      @variables = Variable.where(estado: 'A')
    end
end
