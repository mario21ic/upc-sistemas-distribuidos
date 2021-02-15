json.extract! cliente, :id, :tipo_documento, :numero_documento, :estado, :usu_crea, :fec_crea, :usu_mod, :fec_mod, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
