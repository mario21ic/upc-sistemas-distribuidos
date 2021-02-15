class CreateCaracteristicasProyectos < ActiveRecord::Migration[6.0]
  def change
    create_table :caracteristicas_proyectos do |t|
      t.integer :cod_proyecto
      t.string :cod_caracteristica
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
