json.extract! proyecto, :id, :cod_proyecto, :nombre, :ubicacion, :descripcion_corta, :descripcion_larga, :precio_m2, :mca_favorito, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :created_at, :updated_at, :departamento, :provincia, :distrito, :latitud, :longitud, :caracteristicas
json.url proyecto_url(proyecto, format: :json)
