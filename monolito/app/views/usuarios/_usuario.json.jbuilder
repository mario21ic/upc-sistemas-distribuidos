json.extract! usuario, :id, :tipo_documento, :numero_documento, :codigo_usuario, :contraseña, :correo_corporativo,:correo_personal, :perfil, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
