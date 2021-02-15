class CreateArchivos < ActiveRecord::Migration[6.0]
  def change
    create_table :archivos do |t|
      t.integer :cod_archivo
      t.integer :cod_tip_archivo
      t.integer :cod_proyecto
      t.integer :cod_departamento
      t.string :nombre_archivo
      t.string :descripcion_corta
      t.string :descripcion_larga
      t.integer :orden
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
