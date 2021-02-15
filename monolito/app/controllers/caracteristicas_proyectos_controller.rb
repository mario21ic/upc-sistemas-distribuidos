class CaracteristicasProyectosController < ApplicationController
  before_action :set_caracteristicas_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /caracteristicas_proyectos
  # GET /caracteristicas_proyectos.json
  def index
    @caracteristicas_proyectos = CaracteristicasProyecto.all
  end

  # GET /caracteristicas_proyectos/1
  # GET /caracteristicas_proyectos/1.json
  def show
  end

  # GET /caracteristicas_proyectos/new
  def new
    @caracteristicas_proyecto = CaracteristicasProyecto.new
  end

  # GET /caracteristicas_proyectos/1/edit
  def edit
  end

  # POST /caracteristicas_proyectos
  # POST /caracteristicas_proyectos.json
  def create
    @caracteristicas_proyecto = CaracteristicasProyecto.new(caracteristicas_proyecto_params)

    respond_to do |format|
      if @caracteristicas_proyecto.save
        format.html { redirect_to @caracteristicas_proyecto, notice: 'Caracteristicas proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @caracteristicas_proyecto }
      else
        format.html { render :new }
        format.json { render json: @caracteristicas_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caracteristicas_proyectos/1
  # PATCH/PUT /caracteristicas_proyectos/1.json
  def update
    respond_to do |format|
      if @caracteristicas_proyecto.update(caracteristicas_proyecto_params)
        format.html { redirect_to @caracteristicas_proyecto, notice: 'Caracteristicas proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @caracteristicas_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @caracteristicas_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caracteristicas_proyectos/1
  # DELETE /caracteristicas_proyectos/1.json
  def destroy
    @caracteristicas_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to caracteristicas_proyectos_url, notice: 'Caracteristicas proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caracteristicas_proyecto
      @caracteristicas_proyecto = CaracteristicasProyecto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def caracteristicas_proyecto_params
      params.require(:caracteristicas_proyecto).permit(:cod_proyecto, :cod_caracteristica, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod)
    end
end
