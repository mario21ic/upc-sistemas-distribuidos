class HomeController < ApplicationController
  before_action :init
  layout "application"

  def index
    @ultimos = "ultimos"
    @proyectos = Proyecto.where("estado!='I' AND mca_favorito = 'S'")
    @departamentos = Departamento.where("estado!='I'")
    @archivos = Archivo.where("estado!='I'")
  end

  def nosotros
  end

  def proyectos
    @ultimos = "ultimos"
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
    @proyectos = Proyecto.where("estado!='I' #{query}")
    @departamentos = Departamento.where("estado!='I'")
    @archivos = Archivo.where("estado!='I'")
  end

  def acceder
  end

  def contactenos
  end

  private
    def init
      @variables = Variable.where(estado:'A')
    end

    def querys(texto, valor)
      r = ''
      if valor != ''
        r = "and #{texto} = '#{valor}' "
      end
      r
    end

end
