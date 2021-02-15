json.extract! persona, :id, :tipo_documento, :numero_documento, :nombres, :apellidos, :correo, :telefono, :mca_juridico, :sexo, :fecha_aniversario, :date, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :created_at, :updated_at
json.url persona_url(persona, format: :json)
