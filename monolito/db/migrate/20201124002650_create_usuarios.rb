class CreateUsuarios < ActiveRecord::Migration[6.0]
  def change
    create_table :usuarios, if_not_exists: true do |t|
      t.string :tipo_documento
      t.string :numero_documento
      t.string :codigo_usuario
      t.string :contraseña
      t.string :correo_corporativo
      t.string :perfil
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod
      t.string :telefono
      t.string :correo_personal
      t.string :nombre
      t.string :apellido

      t.timestamps
    end
  end
end
