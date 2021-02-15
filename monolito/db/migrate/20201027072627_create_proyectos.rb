class CreateProyectos < ActiveRecord::Migration[6.0]
  def change
    create_table :proyectos do |t|
      t.integer :cod_proyecto
      t.string :nombre
      t.string :ubicacion
      t.string :descripcion_corta
      t.string :descripcion_larga
      t.decimal :precio_m2
      t.string :mca_favorito
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
