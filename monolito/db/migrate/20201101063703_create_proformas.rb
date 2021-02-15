class CreateProformas < ActiveRecord::Migration[6.0]
  def change
    create_table :proformas do |t|
      t.integer :cod_proforma
      t.integer :cod_solictud
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
