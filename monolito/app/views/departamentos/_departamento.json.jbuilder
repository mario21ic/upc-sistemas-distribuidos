json.extract! departamento, :id, :cod_departamento, :cod_proyecto, :numero, :piso, :area_total, :area_techada, :dormitorios, :baños, :mca_favorito, :descripcion_corta, :descripcion_larga, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :created_at, :updated_at
json.url departamento_url(departamento, format: :json)
