json.extract! solicitud, :id, :cod_solictud, :cod_departamento, :tipo_documento, :numero_documento, :nombres, :apellidos, :correo, :telefono, :mensaje, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :created_at, :updated_at
json.url solicitud_url(solicitud, format: :json)
