json.extract! archivo, :id, :cod_archivo, :cod_tip_archivo, :cod_proyecto, :cod_departamento, :nombre_archivo, :descripcion_corta, :descripcion_larga, :orden, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :created_at, :updated_at
json.url archivo_url(archivo, format: :json)
