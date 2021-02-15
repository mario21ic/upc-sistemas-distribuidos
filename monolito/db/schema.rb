# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_30_225658) do

  create_table "archivos", force: :cascade do |t|
    t.integer "cod_archivo"
    t.integer "cod_tip_archivo"
    t.integer "cod_proyecto"
    t.integer "cod_departamento"
    t.string "nombre_archivo"
    t.string "descripcion_corta"
    t.string "descripcion_larga"
    t.integer "orden"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "caracteristicas_proyectos", force: :cascade do |t|
    t.integer "cod_proyecto"
    t.string "cod_caracteristica"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cita", force: :cascade do |t|
    t.integer "cod_cita"
    t.integer "cod_solicitud"
    t.datetime "fecha"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "solicitud_id"
    t.index ["solicitud_id"], name: "index_cita_on_solicitud_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "tipo_documento"
    t.string "numero_documento"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "departamentos", force: :cascade do |t|
    t.integer "cod_departamento"
    t.integer "cod_proyecto"
    t.integer "numero"
    t.integer "piso"
    t.decimal "area_total"
    t.decimal "area_techada"
    t.decimal "dormitorios"
    t.decimal "baños"
    t.string "mca_favorito"
    t.string "descripcion_corta"
    t.string "descripcion_larga"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "separado"
    t.boolean "vendido"
  end

  create_table "movimimiento_venta", force: :cascade do |t|
    t.integer "numero_movimiento"
    t.integer "cod_venta"
    t.string "tipo_movimiento"
    t.string "numero_operacion"
    t.decimal "monto"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "personas", force: :cascade do |t|
    t.string "tipo_documento"
    t.string "numero_documento"
    t.string "nombres"
    t.string "apellidos"
    t.string "correo"
    t.string "telefono"
    t.string "mca_juridico"
    t.string "sexo"
    t.string "fecha_aniversario"
    t.string "date"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "proformas", force: :cascade do |t|
    t.integer "cod_proforma"
    t.integer "cod_solictud"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "solicitud_id"
    t.string "nombres"
    t.string "apellidos"
    t.string "dni"
    t.string "correo"
    t.string "telefono"
    t.decimal "costo_base"
    t.decimal "descuento"
    t.decimal "costo_final"
    t.index ["solicitud_id"], name: "index_proformas_on_solicitud_id"
  end

  create_table "proyectos", force: :cascade do |t|
    t.integer "cod_proyecto"
    t.string "nombre"
    t.string "ubicacion"
    t.string "descripcion_corta"
    t.string "descripcion_larga"
    t.decimal "precio_m2"
    t.string "mca_favorito"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "departamento"
    t.string "provincia"
    t.string "distrito"
    t.string "latitud"
    t.string "longitud"
  end

  create_table "separars", force: :cascade do |t|
    t.string "nombres"
    t.string "apellidos"
    t.string "dni"
    t.string "correo"
    t.string "voucher"
    t.decimal "monto"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "departamento_id"
    t.index ["departamento_id"], name: "index_separars_on_departamento_id"
  end

  create_table "solicituds", force: :cascade do |t|
    t.integer "cod_solictud"
    t.integer "cod_departamento"
    t.string "tipo_documento"
    t.string "numero_documento"
    t.string "nombres"
    t.string "apellidos"
    t.string "correo"
    t.string "telefono"
    t.string "mensaje"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "departamento_id"
    t.index ["departamento_id"], name: "index_solicituds_on_departamento_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "codigo"
    t.string "numero_documento"
    t.string "codigo_usuario"
    t.string "contraseña"
    t.string "correo_corporativo"
    t.string "perfil"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.string "telefono"
    t.string "correo_personal"
    t.string "nombre"
    t.string "apellido"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "apellido_materno"
    t.string "genero"
    t.string "tipo_persona"
    t.string "tipo_doc"
  end

  create_table "variables", force: :cascade do |t|
    t.string "tipo_variable"
    t.string "codigo_variable"
    t.string "descricion_variable"
    t.string "dato_extra"
    t.string "dato_extra2"
    t.string "dato_extra3"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "venta", force: :cascade do |t|
    t.integer "cod_venta"
    t.string "tipo_documento"
    t.string "numero_documento"
    t.integer "cod_departamento"
    t.integer "cod_solicitud"
    t.string "tipo_compra"
    t.decimal "total"
    t.decimal "saldo"
    t.string "estado"
    t.string "usu_crea"
    t.datetime "fec_crea"
    t.string "usu_mod"
    t.datetime "fec_mod"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "departamento_id"
    t.string "nombres"
    t.string "apellidos"
    t.string "correo"
    t.string "telefono"
    t.string "operacion_bancaria"
    t.string "monto"
    t.string "financiado"
    t.index ["departamento_id"], name: "index_venta_on_departamento_id"
  end

  add_foreign_key "cita", "solicituds"
  add_foreign_key "proformas", "solicituds"
  add_foreign_key "separars", "departamentos"
  add_foreign_key "solicituds", "departamentos"
  add_foreign_key "venta", "departamentos"
end
