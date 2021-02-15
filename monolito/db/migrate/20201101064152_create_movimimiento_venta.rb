class CreateMovimimientoVenta < ActiveRecord::Migration[6.0]
  def change
    create_table :movimimiento_venta do |t|
      t.integer :numero_movimiento
      t.integer :cod_venta
      t.string :tipo_movimiento
      t.string :numero_operacion
      t.decimal :monto
      t.string :estado
      t.string :usu_crea
      t.datetime :fec_crea
      t.string :usu_mod
      t.datetime :fec_mod

      t.timestamps
    end
  end
end
