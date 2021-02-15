class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy, :home]
  before_action :init, only: [:show,:index, :home]

  layout "application"

  # GET /proyectos
  # GET /proyectos.json
  def index
    query = " "

    direccion = params[:direccion]
    if direccion != nil
      if direccion
        query = query + "and (ubicacion like '%#{direccion}%' or nombre like '%#{direccion}%') "
      end

      query = query + querys("estado", params[:estado])
      query = query + querys("departamento", params[:departamento])
      query = query + querys("provincia", params[:provincia])
      query = query + querys("distrito", params[:distrito])


      habitaciones = params[:habitaciones]
      banio = params[:banio]
      pisos = params[:pisos]
      total = params[:total]
      precio = params[:precio]
      
      if habitaciones != '' || banio != '' || pisos != '' || total != '' || precio != ''
        query = query + "and exists (select 1 from \"departamentos\" where \"departamentos\".cod_proyecto = \"proyectos\".id "
      end

      if habitaciones == '4'
        query = query + "and dormitorios > 3 "
      elsif habitaciones != ''
        query = query + "and dormitorios = #{habitaciones} "
      end

      if banio == '4'
        query = query + "and baños > 3 "
      elsif banio != ''
        query = query + "and baños = #{banio} "
      end

      if pisos == '4'
        query = query + "and piso > 3 "
      elsif pisos != ''
        query = query + "and piso = #{pisos} "
      end

      if total == 'value1'
        query = query + "and area_total <= 20 "
      elsif total == 'value2'
        query = query + "and area_total between 21 and 40 "
      elsif total == 'value3'
        query = query + "and area_total > 40 "
      end

      if precio == 'value1'
        query = query + "and ((area_total * Proyectos.precio_m2) - (area_total * Proyectos.precio_m2 * ((piso - 1)/100))) <= 50000 "
      elsif precio == 'value2'
        query = query + "and ((area_total * Proyectos.precio_m2) - (area_total * Proyectos.precio_m2 * ((piso - 1)/100))) between 50001 and 150000 "
      elsif precio == 'value3'
        query = query + "and ((area_total * Proyectos.precio_m2) - (area_total * Proyectos.precio_m2 * ((piso - 1)/100))) > 150000 "
      end

      if habitaciones != '' || banio != '' || pisos != '' || total != '' || precio != ''
        query = query + ")"
      end
    end
    @proyectos = Proyecto.where("1=1 #{query}")


    @departamentos = Departamento.where(estado: 'A')
    @archivos = Archivo.where(estado: 'A')
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
    @archivos = Archivo.where(estado: 'A')
    @departamentos = Departamento.where(cod_proyecto: params[:id])
    @caracteristicas_proyecto = CaracteristicasProyecto.where(cod_proyecto: params[:id],estado: 'A')
  end

  # GET /proyectos/1/home
  def home
    @home = 'S'
    show
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
    @variables = Variable.where(estado: 'A')
  end

  # GET /proyectos/1/edit
  def edit
    @archivos = Archivo.where(estado: 'A')
    @variables = Variable.where(estado: 'A')
    @caracteristicas_proyecto = CaracteristicasProyecto.where(cod_proyecto: params[:id],estado: 'A')
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        
        if params[:proyecto][:caracteristicas]
          params[:proyecto][:caracteristicas].each do |key,value|
            CaracteristicasProyecto.create(cod_proyecto:@proyecto.id, cod_caracteristica: key, estado: 'A', usu_crea: nil, fec_crea: nil)
          end
        end

        format.html { redirect_to @proyecto, notice: 'Proyecto was successfully created.' }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)

        cc = []
        if params[:proyecto][:caracteristicas]
          params[:proyecto][:caracteristicas].each do |key,value|
                cc.push(key)
          end
        end

        CaracteristicasProyecto.where(cod_proyecto: @proyecto.id).each do |caracteristica|
            x = CaracteristicasProyecto.find(caracteristica.id)
            estado = nil
            ccp = cc.select {|item|caracteristica.cod_caracteristica == item}
            
            if ccp.count > 0
              cc = cc.select {|item|caracteristica.cod_caracteristica != item}
              if caracteristica.estado == 'I'
                estado = 'A'
              end
            else
              estado = 'I'
            end
            if estado
                x.update(cod_proyecto:@proyecto.id, cod_caracteristica: caracteristica.cod_caracteristica, estado: estado, usu_crea: nil, fec_crea: nil)
            end
        end

        cc.each do |value|
          CaracteristicasProyecto.create(cod_proyecto:@proyecto.id, cod_caracteristica: value, estado: 'A', usu_crea: nil, fec_crea: nil)
        end

        format.html { redirect_to @proyecto, notice: 'Proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto }
      else
        format.html { render :edit }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'Proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def proyecto_params
      params.require(:proyecto).permit(:cod_proyecto, :nombre, :ubicacion, :descripcion_corta, :descripcion_larga, :precio_m2, :mca_favorito, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :departamento, :provincia, :distrito, :latitud, :longitud, :caracteristicas)
    end

    # Only allow a list of trusted parameters through.
    def init
      @variables = Variable.where(estado: 'A')
    end

    def querys(texto, valor)
      r = ''
      if valor != ''
        r = "and #{texto} = '#{valor}' "
      end
      r
    end
end
