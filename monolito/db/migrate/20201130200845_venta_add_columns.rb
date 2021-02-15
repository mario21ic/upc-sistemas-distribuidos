class VentaAddColumns < ActiveRecord::Migration[6.0]
  def change
    add_reference :venta, :departamento, foreign_key: true
    add_column :venta, :nombres, :string
    add_column :venta, :apellidos, :string
    add_column :venta, :correo, :string
    add_column :venta, :telefono, :string
    add_column :venta, :operacion_bancaria, :string
    add_column :venta, :monto, :string
    add_column :venta, :financiado, :string
  end
end
