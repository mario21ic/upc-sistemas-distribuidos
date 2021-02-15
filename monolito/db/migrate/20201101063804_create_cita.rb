class CreateCita < ActiveRecord::Migration[6.0]
  def change
    create_table :cita do |t|
      t.integer :cod_cita
      t.integer :cod_solicitud
      t.datetime :fecha
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
