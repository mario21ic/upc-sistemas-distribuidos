class CreateDepartamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :departamentos do |t|
      t.integer :cod_departamento
      t.integer :cod_proyecto
      t.integer :numero
      t.integer :piso
      t.decimal :area_total
      t.decimal :area_techada
      t.decimal :dormitorios
      t.decimal :baños
      t.string :mca_favorito
      t.string :descripcion_corta
      t.string :descripcion_larga
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
