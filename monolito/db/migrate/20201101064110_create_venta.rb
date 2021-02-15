class CreateVenta < ActiveRecord::Migration[6.0]
  def change
    create_table :venta do |t|
      t.integer :cod_venta
      t.string :tipo_documento
      t.string :numero_documento
      t.integer :cod_departamento
      t.integer :cod_solicitud
      t.string :tipo_compra
      t.decimal :total
      t.decimal :saldo
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
