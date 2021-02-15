class CreateSolicituds < ActiveRecord::Migration[6.0]
  def change
    create_table :solicituds do |t|
      t.integer :cod_solictud
      t.integer :cod_departamento
      t.string :tipo_documento
      t.string :numero_documento
      t.string :nombres
      t.string :apellidos
      t.string :correo
      t.string :telefono
      t.string :mensaje
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
