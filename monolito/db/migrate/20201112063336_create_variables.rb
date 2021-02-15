class CreateVariables < ActiveRecord::Migration[6.0]
  def change
    create_table :variables do |t|
      t.string :tipo_variable
      t.string :codigo_variable
      t.string :descricion_variable
      t.string :dato_extra
      t.string :dato_extra2
      t.string :dato_extra3
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
